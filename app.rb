#
# Copyright:: Copyright (c) 2014 Chef Software, Inc.
# License:: Apache License, Version 2.0
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

ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require_relative 'routes/init'
require_relative 'helpers/init'

class WebhookReceiver < Sinatra::Base
  register Sinatra::ConfigFile
  set :root, File.dirname(__FILE__)
  config_file 'config/settings.yml'



  configure do
    set :app_file, __FILE__
    enable :logging

  end

  before do
    logger.datetime_format = "%Y/%m/%d @ %H:%M:%S "
    logger.level = Logger::INFO
  end
end
