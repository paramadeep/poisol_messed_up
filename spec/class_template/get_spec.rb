require_relative './../spec_helper'

describe ClassTemplate, "#get_books" do

  it "default request and response" do
    Book.new.build()
    response = RestClient.get "http://http//localhost:7098:80/book",{:params => {:author=>'bharathi'}}
    expect(response.body).to eq("title"=>"independance", "category"=>{"age_group"=>"10", "genre"=>"action", "publisher"=>{"name"=>"summa", "place"=>"erode"}})
  end

 end

