require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

%w[ vim-enhanced curl wget git bind-utils ].each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

describe("emacs") do
  it { should_not be_installed }
end

describe file("/root/.bashrc") do
  it { should be_file }
  its(:content){ should match /export PATH=/ }
  its(:content){ should match /export EDITOR=vim/ }
end

describe file("/root/mysupermostfavoritedirectory") do
  it { should be_directory }
end
