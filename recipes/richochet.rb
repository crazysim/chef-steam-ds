
execute "#{node['steam']['dir']}/steam -command update -game cstrike -dir cstrike" do
  cwd node['steam']['dir']
  user node['steam']['user']
end

