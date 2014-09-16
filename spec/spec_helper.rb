require "rspec/expectations"
require 'rest_client'
require 'webmock'
include WebMock::API

require_relative '../lib/poisol'
require 'pry'

RSpec.configure do |config|
  config.before(:each) do
    WebMock.reset!
  end
  config.before(:all) do
    WebMock.disable_net_connect!(:allow_localhost => true)
    factory = StubFactory.new.build("data")
  end
end

