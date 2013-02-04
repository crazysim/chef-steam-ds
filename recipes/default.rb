#
# Cookbook Name:: steam-ds
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group 'steam-ds'

user "steam-ds" do
  group "steam-ds"
  shell "/bin/bash"
end

directory "/opt/steam-ds" do
  owner "steam-ds"
  group "steam-ds"
  mode "755"
  action :create
end

remote_file "/opt/steam-ds/hldsupdatetool.bin" do
  source "http://storefront.steampowered.com/download/hldsupdatetool.bin"
  # This file hasn't changed since 2005
  action :create_if_missing
  owner "steam-ds"
  group "steam-ds"
  mode "755"
end
