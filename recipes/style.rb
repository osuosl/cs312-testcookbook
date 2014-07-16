package "vim" do
  action :upgrade
end

package "git" do
  action :upgrade
end

package "curl" do
  action :upgrade
end


# Foodcritic is a bit picky
# The following will throw FC025
r = gem_package "chef-rewind" do
  action :nothing
end

r.run_action(:install)
Gem.clear_paths

# The following will not throw FC025
# but is equivalent
gem_package "chef-rewind" do
  action :nothing
end.run_action(:install)
Gem.clear_paths


execute "git clone https://github.com/osuosl/ganeti_webmgr" do
  action :run
end
