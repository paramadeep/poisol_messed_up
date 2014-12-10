require_relative "webmock_stub_builder"
require_relative "stub_class_builder"

class Stub
  include WebMockStubBuilder
  attr_accessor :request,:response
  @request_array_item
  @response_array_item
  @stub_config
  class << self
    include StubClassBuilder

    def set_stub_config stub_config
      @stub_config = stub_config
      define_method("stub_config") do
        return stub_config
      end
    end
  end

  def initialize
    @request = Request.new
    @response = Response.new
    @request.url = stub_config.request.url.deep_dup
    @request.query = stub_config.request.query.deep_dup
    @request.body = stub_config.request.body.deep_dup
    @request.body = {} if stub_config.request.include_explicit_only
    if stub_config.response.is_column_array or stub_config.response.is_row_array 
      @response.body = []
    else
      @response.body = stub_config.response.body.deep_dup
    end
  end

  def set_dumb_response response_file
    @response.body = Parse.json_file_to_hash(response_file)
    @is_response_dumped = true
    self
  end

  def get_assignment_value actual_field_value,input_value
    if  actual_field_value.class.to_s == "Hash" 
      input_value = {} if input_value.blank?
      actual_field_value.deep_merge(input_value) 
    else
      input_value
    end
  end

end

class Request 
  attr_accessor :url,:query,:body
end

class Response 
  attr_accessor :body,:status
end


