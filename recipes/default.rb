#
# Cookbook Name:: steam-ds
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

user node['steam']['user'] do
  action :create
  home node['steam']['dir']
  shell '/bin/sh'
  system true
end

directory node['steam']['dir'] do
  owner node['steam']['user']
  group node['steam']['user']
  mode "0755"
  action :create
end

package "ia32-libs" do
  action :install
  only_if {['foo'].pack('p').size == 8}
end

remote_file "#{node['steam']['dir']}/hldsupdatetool.bin" do
  source "http://storefront.steampowered.com/download/hldsupdatetool.bin"
  # This file hasn't changed since 2005
  action :create_if_missing
  owner node['steam']['user']
  group node['steam']['user']
  mode "755"
end

execute "echo yes | #{node['steam']['dir']}/hldsupdatetool.bin" do
  cwd node['steam']['dir']
  user node['steam']['user']
end

# Run steam twice
2.times do
  execute "#{node['steam']['dir']}/steam" do
    cwd node['steam']['dir']
    user node['steam']['user']
    # Sometimes it updates and it returns 1 on successful update
    returns [0,1]
  end
end
