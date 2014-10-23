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