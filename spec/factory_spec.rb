require_relative './spec_helper'

describe Factory, "#score" do
  it "dynamic request and response" do
    name = "dummy"
    job = "vetti"
    factory = Factory.build("data")
    User.new.byName(name).hasJob(job).build()
    response = RestClient.post "http://http//localhost:7098:80/users","name"=>name
    expect(response.body).to eq("job"=>job)
  end

  it "default request and response" do
    factory = Factory.build("data")
    User.new.build()
    response = RestClient.post "http://http//localhost:7098:80/users","name"=>"deepak"
    expect(response.body).to eq("job"=>'sleeping_bag')
  end
end

