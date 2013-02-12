# Can't believe you're installing this.

execute "#{node['steam']['dir']}/steam -command update -game cstrike -dir cstrike" do
  user node['steam']['user']
  cwd node['steam']['dir']
end

