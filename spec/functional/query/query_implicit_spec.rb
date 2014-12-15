describe Stub, "#get_books" do

  it "dynamic response" do
    Book.new.has_category({"age_group"=>"11", "publisher"=>{"name"=>"oxford"}}).build()
    response = RestClient.get "http://localhost:80/book",{:params => {:author=>'bharathi',:name=>"doni"}}
    expect(response.body).to eq({"title"=>"independance", "category"=>{"age_group"=>"11", "genre"=>"action", "publisher"=>{"name"=>"oxford", "place"=>"erode"}}}.to_json)
  end

  it "default request and response" do
    Book.new.build()
    response = RestClient.get "http://localhost:80/book",{:params => {:author=>'bharathi',:name=>"doni"}}
    expect(response.body).to eq({"title"=>"independance", "category"=>{"age_group"=>"10", "genre"=>"action", "publisher"=>{"name"=>"summa", "place"=>"erode"}}}.to_json)
  end

end

