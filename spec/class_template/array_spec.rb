describe ClassTemplate, "#array" do

  #before { skip }

  it "column array" do
    Columns.new.has_column().build
    response = RestClient.get "http://http//localhost:7098:80/column"
    expect(response.body).to eq(["title"=>"independance", "category"=>{"age_group"=>"10"}])
  end

end
