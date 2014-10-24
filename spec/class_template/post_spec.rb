require_relative './../spec_helper'

describe ClassTemplate, "#post_user" do

  it "default request and response" do
    User.new.build()
    response = RestClient.post "http://http//localhost:7098:80/users","name"=>"deepak"
    expect(response.body).to eq("job"=>'sleeping_bag')
  end

  it "dynamic request and response" do
    name = "dummy"
    job = "vetti"
    User.new.byName(name).hasJob(job).build()
    response = RestClient.post "http://http//localhost:7098:80/users","name"=>name
    expect(response.body).to eq("job"=>job)
  end

end
