module ClassTemplate

  attr_reader :request_response,:base_file,:url,:request,:response

  def initialize
    @base_file = ConfigMap.file self.class.name
    config = Parse.yaml_file @base_file
    @url = config.request.url
  end

  def build
    make_stub
  end

  private
  def make_stub 
    stub_request(:get, "http://http//localhost:7098:80/#{@url}").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
  end

end

