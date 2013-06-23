#
# Cookbook Name:: osx-apps
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "dmg"

dmg_package "Google Chrome" do
  dmg_name "googlechrome"
  source "https://dl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
  action :install
end

dmg_package "Firefox" do
  dmg_name "Firefox\ 21.0"
  source "http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/21.0/mac/en-US/Firefox%2021.0.dmg"
  action :install
end

zip_app_package "Processgin" do
  source "http://download.processing.org/processing-2.0.1-macosx.zip"
end

zip_app_package "iTerm2" do
  source "http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip"
end
