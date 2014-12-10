class Endpoints
  def call env
    [200, {'Content-Type' => 'text/html'}, ['<p>Hello, World 2!</p>']]
  end
end