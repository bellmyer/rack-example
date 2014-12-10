class Endpoints
  attr_reader :env, :method, :path
  
  class << self
    def call env
      new(env).response
    end
  end
  
  def initialize env
    @env = env
    @method = env['REQUEST_METHOD']
    @path = env['PATH_INFO']
  end

  def get_turtles
    html('<p>Turtles!</p>')
  end
  
  def response
    send "#{method}#{path}".gsub('/', '_').downcase
  end
  
  def params
    return @params if defined?(@params)
    @params = Rack::Utils.parse_nested_query(env['QUERY_STRING'])
  end
  
  def method_missing method_name, *args, &block
    puts "METHOD: #{method_name}"
    [404, {'Content-Type' => 'text/plain'}, ['']]
  end
  
  def html content
    [200, {'Content-Type' => 'text/html'}, [content]]
  end
  
  def text content
    [200, {'Content-Type' => 'text/plain'}, [content]]
  end
end