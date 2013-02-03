#
# Cookbook Name:: hlds
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group 'hlds'

user "hlds" do
  group "hlds"
  shell "/bin/bash"
end

directory "/opt/hlds" do
  owner "hlds"
  group "hlds"
  mode "755"
  action :create
end

remote_file "/opt/hlds/hldsupdatetool.bin" do
  source "http://storefront.steampowered.com/download/hldsupdatetool.bin"
  # This file hasn't changed since 2005
  action :create_if_missing
end
