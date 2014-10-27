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
    @request.url = @config["request"]["url"]
    @request.type = @config["request"]["type"].intern
    @request.query = @config["request"]["query"]
    @request.body = @is_inline?  get_inline_request_body : get_exploaded_request_body
  end

  def build_response
    @response = Response.new
    response.body = @is_inline? get_inline_response_body  : get_exploaded_response_body
    handle_resonse_array_type
  end

  def handle_resonse_array_type
    return if @config["response"].nil?
    array_type = @config["response"]["array_type"]
    @response.array_type = array_type.nil? ? "" : array_type
  end


  def get_inline_response_body
    body = @config["response"]["body"]
    return (body.nil?) ? "": (Parse.json_to_hash body)
  end

  def get_inline_request_body
    body = @config["request"]["body"]
    return (body.nil?) ? "": (Parse.json_to_hash body)
  end

  def get_exploaded_request_body
    request_file = "#{File.dirname @config_file}/request.json"
    return (File.exists? request_file) ? Parse.json_file_to_hash(request_file) : ""
  end

  def get_exploaded_response_body
    response_file = "#{File.dirname @config_file}/response.json"
    return (File.exists? response_file)? Parse.json_file_to_hash(response_file) : ""
  end

end


class Request
  attr_accessor :url,:type,:query,:body
end

class Response 
  attr_accessor :body,:array_type
end

