require_relative '../lib/poisol'
require 'rest_client'
require 'pry'

describe Factory, "#score" do
  it "returns class for the yaml" do
    factory = Factory.build("data")
    User.new.byName('dummy').build()
    response = RestClient.post "http://http//localhost:7098:80/users","name"=>"dummy"
    expect(response.body).to eq("job"=>"sleeping_bag")
  end
end

