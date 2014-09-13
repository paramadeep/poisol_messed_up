module ClassTemplate

  attr_reader :request_response,:base_file,:url,:request,:response

  def initialize
    @base_file = ConfigMap.file self.class.name
    config = Parse.yaml_file @base_file
    @url = config.request.url
    @request = Parse.json_file_to_hash (ConfigMap.request self.class.name)
    generate_request_methods
  end

  def build
    make_stub
  end

  def generate_request_methods 
    @request.each do |field|
      define_singleton_method("by#{field[0].capitalize}") do |*value|
        @request[field[0]] = value[0]
        self
      end
    end
  end

  private
  def make_stub 
    stub_request(:post, "http://http//localhost:7098:80/users").
               with(:body => @request).
                        to_return(:status => 200, :body => "", :headers => {})

    #stub_request(:post, "http://http//localhost:7098:80/#{@url}").
    #with(:body => @request).
      #to_return(:status => 200, :body => "", :headers => {})
  end

end

