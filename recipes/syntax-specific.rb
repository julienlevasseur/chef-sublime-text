#
# Cookbook:: sublime_text
# Recipe:: syntax-specific
#
# Copyright:: 2017, Julien Levasseur , All Rights Reserved.

node['sublime_text']['users'].each do |user|
  node['sublime_text']['syntax_specific'].each do |language, options|
    template "/home/#{user}/.config/sublime-text-3/Packages/User/#{language}.sublime-settings" do
      source 'language.sublime-settings.erb'
      owner user
      group user
      mode '0644'
      variables(
        options: options
      )
    end
  end

  cookbook_file "/home/#{user}/.config/sublime-text-3/Packages/User/Terraform.sublime-settings" do
    source 'Terraform.sublime-settings'
    owner user
    group user
    mode '0644'
  end
end
