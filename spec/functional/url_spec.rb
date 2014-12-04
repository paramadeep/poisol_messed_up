describe ClassTemplate, "#url" do

  it "default" do
    Url.new.build()
    response = RestClient.get "http://localhost:80/cda/cd/ragavan/get"
    expect(response.body).to eq({"hi"=>1}.to_json)
  end

  it "dynamic" do
    Url.new.for_name("hitler").for_actor("mani").build()
    response = RestClient.get "http://localhost:80/cda/hitler/mani/get"
    expect(response.body).to eq({"hi"=>1}.to_json)
  end
  
  it "partial" do
    Url.new.for_actor("mani").build()
    response = RestClient.get "http://localhost:80/cda/cd/mani/get"
    expect(response.body).to eq({"hi"=>1}.to_json)
  end

end


