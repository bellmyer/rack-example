#!/usr/bin/env ruby

require 'rack'

app = lambda do |env|
  [200, {'Content-Type' => 'text/html'}, ['<p>Hello, World!</p>']]
end

Rack::Handler::WEBrick.run app