#
# Cookbook Name:: unix-tools
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

package "tmux"
package "htop"
package "tree"
package "emacs"
package "zsh"
package "rlwrap"
package "exiftool"

package "tmux" do
   action :install
end

package "htop" do
   action :install
end

package "tree" do
   action :install
end

package "rlwrap" do
   action :install
end

package "exiftool" do
   action :install
end

package "emacs" do
   action :install
end

package "zsh" do
   action :install
end
