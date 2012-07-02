require_recipe "git"

git "/var/lib/deliver" do
  repository "git://github.com/gerhard/deliver.git"
  reference "v#{node[:deliver][:version]}"
  action :sync
end
