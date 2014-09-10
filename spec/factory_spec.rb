require_relative '../lib/poisol'

describe Factory, "#score" do
  it "returns class for the yaml" do
    factory = Factory.new.build()
    User.new.build()
    #expect(user).to eq(42)
    Net::HTTP.get("http://localhost:7098", "/users") 
  end
end

