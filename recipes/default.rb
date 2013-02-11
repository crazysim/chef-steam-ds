#
# Cookbook Name:: steam-ds
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'user'

user_account "steam-ds"

package "ia32-libs" do
  action :install
  only_if {['foo'].pack('p').size == 8}
end

remote_file "/home/steam-ds/hldsupdatetool.bin" do
  source "http://storefront.steampowered.com/download/hldsupdatetool.bin"
  # This file hasn't changed since 2005
  action :create_if_missing
  owner "steam-ds"
  group "steam-ds"
  mode "755"
end

execute "echo yes | /home/steam-ds/hldsupdatetool.bin" do
  cwd "/home/steam-ds"
  user "steam-ds"
end

2.times do
  execute "/home/steam-ds/steam" do
    cwd "/home/steam-ds"
    user "steam-ds"
    # Sometimes it updates
    returns [0,1]
  end
end
