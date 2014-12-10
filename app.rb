#!/usr/bin/env ruby

require 'rack'
require './lib/endpoints'

Rack::Handler::WEBrick.run Endpoints.new