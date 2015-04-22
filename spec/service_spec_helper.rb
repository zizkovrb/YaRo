ENV['RACK_ENV'] = 'test'
require 'rack/test'

require_relative '../service'
require_relative '../lib/yaksi'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Service::Root
end

