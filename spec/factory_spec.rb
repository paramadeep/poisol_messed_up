require_relative '../lib/poisol'
require 'rest_client'
require 'pry'

describe Factory, "#score" do
  it "returns class for the yaml" do
    factory = Factory.build("data")
    User.new.build()
    #User.new.withName('dummmy').build()
    #expect(user).to eq(42)
    #Net::HTTP.post_form("http://localhost:7098/users","name"=>"deepak") 
    RestClient.post "http://http//localhost:7098:80/users","name"=>"deepak"
  end
end

