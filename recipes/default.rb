git node[:deliver][:dir] do
  repository node[:deliver][:repository]
  reference "v#{node[:deliver][:version]}"
  action :sync
end
