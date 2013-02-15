# Can't believe you're installing this.

include_recipe "tmux"
include_recipe "supervisor"

execute "#{node['steam']['dir']}/steam -command update -game valve -dir valve" do
  user node['steam']['user']
  cwd node['steam']['dir']
end

supervisor_service "valve" do
  action :enable
  directory "#{node['steam']['dir']}/valve"
  command "#{node['steam']['dir']}/valve/hlds_run"
  user node['steam']['user']
end

