require_relative '../lib/poisol'

require 'pry'

describe Factory, "#score" do
  it "returns class for the yaml" do
    factory = Factory.build("data")
    User.new.build()
    #expect(user).to eq(42)
    Net::HTTP.get("http://localhost:7098", "/users") 
  end
end

