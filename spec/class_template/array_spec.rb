describe ClassTemplate, "#array" do

  it "column array" do
    Columns.new.has_column.has_column.with_title("abc").with_category("12").build
    response = RestClient.get "http://http//localhost:7098:80/column"
    expect(response.body).to eq({"title"=>["independance", "abc"], "category"=>["10","12"]})
  end

  it "row array" do
    Rows.new.has_row.has_row.with_title("abc").with_category("age_group" => "12").build
    response = RestClient.get "http://http//localhost:7098:80/row"
    expect(response.body).to eq([{"title"=>"independance", "category"=>{"age_group"=>"10"}}, {"title"=>"abc", "category"=>{"age_group"=>"12"}}])
  end

end
