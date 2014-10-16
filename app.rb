require 'sinatra/base'
require 'sinatra/config_file'

require 'json'
require 'mixlib/shellout'
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