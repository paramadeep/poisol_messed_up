module ClassTemplate
  def build()
    make_stub
  end

  def make_stub 
    stub_request(:get, "http://http//localhost:7098:80/users").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
  end

end

