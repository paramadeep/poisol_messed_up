require 'yaml'
require 'recursive-open-struct'
require 'webmock'
require_relative './class_template'

include WebMock::API
WebMock.disable_net_connect!(:allow_localhost => true)


class Factory
  attr_reader :request_response 
  def build
    @request_response = RecursiveOpenStruct.new(YAML.load_file("data/user.yml"),:recurse_over_arrays => true)
    dynamic_name = "User"
    Object.const_set(dynamic_name, Class.new { include ClassTemplate })
  end

 
end
