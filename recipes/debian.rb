#
# Cookbook:: sublime_text
# Recipe:: debian
#
# Copyright:: 2017, Julien Levasseur, All Rights Reserved.

if node['sublime_text']['state'] == :present
  # Requirement:
  package 'apt-transport-https'

  # Repository management
  bash 'import sublime-text repo key' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
    EOH
    not_if 'apt-key list|grep -i sublime'
  end

  template '/etc/apt/sources.list.d/sublime-text.list' do
    source 'repo.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      uri: node['sublime_text']['repo']['uri'],
      distribution: node['sublime_text']['repo']['distribution']
    )
  end

  apt_update 'update' do
    action :update
    not_if 'dpkg -l|grep -i sublime'
  end

  # Package management
  package 'sublime-text' do # ~FC009
    action :install
  end

  # Package Control plugin management
  node['sublime_text']['users'].each do |user|
    directory "/home/#{user}/.config/sublime-text-3/Installed Packages" do
      action :create
      recursive true
    end

    remote_file "/home/#{user}/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" do
      source 'https://packagecontrol.io/Package%20Control.sublime-package'
      owner user
      group user
      mode '0644'
      action :create
    end

    directory "/home/#{user}/.config/sublime-text-3/Packages/User" do
      action :create
      recursive true
    end

    template "/home/#{user}/.config/sublime-text-3/Packages/User/Package Control.sublime-settings" do
      source 'Package_Control.sublime-settings.erb'
      owner user
      group user
      mode '0644'
      variables(
        packages: node['sublime_text']['packages']
      )
    end
  end

elsif node['sublime_text']['state'] == :absent

  file '/etc/apt/sources.list.d/sublime-text.list' do
    action :delete
  end

  package 'sublime-text' do
    action :remove
  end

  node['sublime_text']['users'].each do |user|
    directory "/home/#{user}/.config/sublime-text-3/Installed Packages" do
      action :delete
      recursive true
    end

    file "/home/#{user}/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" do
      action :delete
    end

    file "/home/#{user}/.config/sublime-text-3/Packages/User/Package Control.sublime-settings" do
      action :delete
    end

    directory "/home/#{user}/.config/sublime-text-3/Packages/User" do
      action :delete
      recursive true
    end
  end
end
