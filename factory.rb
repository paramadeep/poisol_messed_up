require 'yaml'
require 'recursive-open-struct'
require 'webmock'
include WebMock::API
WebMock.disable_net_connect!(:allow_localhost => true)


class Factory
  attr_reader :request_response 
  def build
    @request_response = RecursiveOpenStruct.new(YAML.load_file("data/user.yml"),:recurse_over_arrays => true)
    make_stub
  end

  def make_stub 
    stub_request(:get, "http://http//localhost:7098:80/#{@request_response.request.url}").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
  end

end
