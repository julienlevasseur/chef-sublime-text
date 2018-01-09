# # encoding: utf-8

# Inspec test for recipe sublime_text::debian

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('apt-transport-https') do
  it { should be_installed }
end

describe command('apt-key list|grep -i sublime') do
  its('exit_status') { should eq 0 }
end

describe file('/etc/apt/sources.list.d/sublime-text.list') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  its('group') { should eq 'root' }
end

describe package('sublime-text') do
  it { should be_installed }
end

# user = ENV['USER']
user = 'root'

describe directory("/home/#{user}/.config/sublime-text-3/Installed\ Packages") do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by user }
  its('group') { should eq user }
end

describe file("/home/#{user}/.config/sublime-text-3/Installed Packages/Package Control.sublime-package") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by user }
  its('group') { should eq user }
end

describe directory("/home/#{user}/.config/sublime-text-3/Packages/User") do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by user }
  its('group') { should eq user }
end

describe file("/home/#{user}/.config/sublime-text-3/Packages/User/Package Control.sublime-settings") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by user }
  its('group') { should eq user }
end
