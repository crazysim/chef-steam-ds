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
  system true
  shell "/bin/bash"
end
