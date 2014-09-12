module ClassTemplate

  attr_reader :request_response,:base_file

  def build()
    @base_file = ConfigMap.file(self.class.name)
    config = RecursiveOpenStruct.new(YAML.load_file(@base_file),:recurse_over_arrays => true)
    make_stub
  end

  def make_stub 
    stub_request(:get, "http://http//localhost:7098:80/users").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
  end

end

