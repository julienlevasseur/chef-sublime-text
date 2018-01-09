#
# Cookbook:: sublime_text
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'sublime_text::debian' if platform_family?('debian')

include_recipe 'sublime_text::packages'
include_recipe 'sublime_text::syntax-specific'
