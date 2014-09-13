module ClassTemplate

  attr_reader :request_response,:base_file,:url,:request,:response

  def initialize
    @base_file = ConfigMap.file self.class.name
    config = Parse.yaml_file @base_file
    @url = config.request.url
    @request = Parse.json_file_to_hash (ConfigMap.request self.class.name)
  end

  def build
    make_stub
  end

  private
  def make_stub 
    stub_request(:post, "http://http//localhost:7098:80/#{@url}").
      with(:body => @request,
           :headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'11', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
  end

end

