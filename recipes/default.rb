install = (node[:deliver][:action] == "install")
wan_up = `ping -c 1 -W 1 8.8.8.8`.index(/1 (?:packets )?received/)

if install
  git node[:deliver][:dir] do
    repository node[:deliver][:repository]
    reference node[:deliver][:version]
    action :sync
    only_if { wan_up }
  end
else
  directory node[:deliver][:dir] do
    recursive :true
    action :delete
  end
end

link "/usr/local/bin/deliver" do
	to "#{node[:deliver][:dir]}/bin/deliver"
  action (install ? :create : :delete)
end
