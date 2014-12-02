describe ClassTemplate, "#nested array" do

  #it "empty" do
    #NestedArray.new.build()
    #response = RestClient.get "http://localhost:80/nested_array"
    #expect(response.body).to eq({"title"=>"ind", "roles"=>[]}.to_s)
  #end

  it "default" do
    NestedArray.new.has_role.build()
    response = RestClient.get "http://localhost:80/nested_array"
    expect(response.body).to eq({"title"=>"ind", "roles"=>[{"role_id"=>"chumma", "role_name"=>"sol"}]}.to_s)
  end

  it "dynamic" do
    NestedArray.new.has_role.has_role("role_id"=>"test").build()
    response = RestClient.get "http://localhost:80/nested_array"
    expect(response.body).to eq({"title"=>"ind", "roles"=>[{"role_id"=>"chumma", "role_name"=>"sol"},{"role_id"=>"test", "role_name"=>"sol"}]}.to_s)
  end

end
