#
# Cookbook Name:: osl-testcookbook
# Recipe:: default
#
# Copyright (C) 2014 Oregon State University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "nginx"

iptables_ng_chain 'http'

iptables_ng_rule 'accept_http' do 
    rule '--jump http'
end

iptables_ng_rule 'http' do
    rule ['--protocol tcp --destination-port 80 --jump ACCEPT',
          '--protocol tcp --destination-port 443 --jump ACCEPT']
    chain 'http'
end

