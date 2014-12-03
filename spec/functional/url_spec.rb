describe ClassTemplate, "#url" do

  it "default" do
    Url.new.build()
    response = RestClient.get "http://localhost:80/cd/midnight/ragavan/get"
    expect(response.body).to eq({"hi"=>1}.to_s)
  end

  it "dynamic" do
    Url.new.for_name("hitler").for_actor("mani").build()
    response = RestClient.get "http://localhost:80/cd/hitler/mani/get"
    expect(response.body).to eq({"hi"=>1}.to_s)
  end
  
  it "partial" do
    Url.new.for_actor("mani").build()
    response = RestClient.get "http://localhost:80/cd/midnight/mani/get"
    expect(response.body).to eq({"hi"=>1}.to_s)
  end

end


