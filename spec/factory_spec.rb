require_relative '../factory'
require 'pry'
require_relative 'spec_helper'

describe Factory, "#score" do
  it "returns class for the yaml" do
    factory = Factory.new.build()
    Net::HTTP.get("http://localhost:7098", "/users") 
  end
end

