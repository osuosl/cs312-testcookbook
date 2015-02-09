include_recipe "cs312-testcookbook::http"
include_recipe "python"

package "git"


root_dir = ::File.expand_path(::File.join(
    node['cs312-testcookbook']['wiki-webroot'], '..'))

directory root_dir do
  action :create
  recursive true
  owner "nginx"
  group "nginx"
end

git node['cs312-testcookbook']['wiki-webroot'] do
  repository node['cs312-testcookbook']['repository']
  action :sync
end

execute "install_wiki" do
  command "./scripts/jenkins.sh"
  cwd node['cs312-testcookbook']['wiki-webroot']
end

template '/etc/nginx/sites-available/wiki.osuosl.org.conf' do
  owner "root"
  group "root"
  mode 0644
end

nginx_site 'default' do
  enable false
end
nginx_site 'wiki.osuosl.org.conf'
