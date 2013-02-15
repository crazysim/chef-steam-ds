# Can't believe you're installing this.

include_recipe "tmux"

execute "#{node['steam']['dir']}/steam -command update -game valve -dir valve" do
  user node['steam']['user']
  cwd node['steam']['dir']
end

