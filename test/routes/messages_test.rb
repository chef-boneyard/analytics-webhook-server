require_relative '../../app'
require_relative '../test_helper'
require 'test/unit'
require 'rack/test'

class WebhookReceiverTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    WebhookReceiver.new
  end

  def test_messages
    post '/messages'
    assert_equal true, last_response.body.include?('Sinatra template')
  end
end