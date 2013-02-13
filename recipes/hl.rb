# Can't believe you're installing this.

execute "#{node['steam']['dir']}/steam -command update -game valve -dir valve" do
  user node['steam']['user']
  cwd node['steam']['dir']
end

