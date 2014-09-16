class StubConfig
  attr_reader :response,:request

  def with_file file_name
    @config_file = file_name
    @config = Parse.yaml_file file_name
    self
  end

  def is_inline
    @is_inline = true
    self
  end

  def is_exploded
    @is_inline = false
    self
  end

  def build
    build_request
    build_response
    self
  end

  private
  def build_request
    @request = Request.new
    @request.url = @config["url"]
    @request.type = @config["type"].intern
    @request.query = @config["query"]
    @request.body = @is_inline?  @config["request_body"] : exploaded_request
  end

  def exploaded_request
    request_file = "#{File.dirname @config_file}/request.json"
    return (File.exists? request_file) ? Parse.json_file_to_hash(request_file) : ""
  end

  def build_response
    @response = Response.new
    @response.body = @is_inline? @config["response_body"] : exploaded_response
  end

  def exploaded_response
    response_file = "#{File.dirname @config_file}/response.json"
    return (File.exists? response_file)? Parse.json_file_to_hash(response_file) : ""
  end

end


class Request
  attr_accessor :url,:type,:query,:body
end

class Response 
  attr_accessor :body
end

