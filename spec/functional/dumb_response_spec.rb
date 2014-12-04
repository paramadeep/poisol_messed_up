describe ClassTemplate, "#dumb response" do

  it "column array" do
    Columns.new.set_dumb_response("data/user/response.json").build
    response = RestClient.get "http://localhost:80/column"
    expect(response.body).to eq( "{\"job\"=>\"sleeping_bag\"}")
  end

end
