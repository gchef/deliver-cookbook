install = (node[:deliver][:action] == "install")
wan_up = `host -W 1 google.com`.index(/has address/)

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
