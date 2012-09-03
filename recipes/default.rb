git node[:deliver][:dir] do
  repository node[:deliver][:repository]
  reference node[:deliver][:version]
  action :sync
end

link "/usr/local/bin/deliver" do
	to "#{node[:deliver][:dir]}/bin/deliver"
end
