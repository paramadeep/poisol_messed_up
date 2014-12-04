class StubConfig
  attr_reader :response,:request

  def with_file file_name
    @config_yml_file = file_name
    @config_yml = Parse.yaml_file file_name
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
    @request.url = @config_yml["request"]["url"]
    @request.type = @config_yml["request"]["type"].intern
    @request.query = @config_yml["request"]["query"]
    include_explicit_only = @config_yml["request"]["include_explicit_only"]
    @request.include_explicit_only = include_explicit_only.blank? ? false : include_explicit_only
    @request.body = @is_inline?  get_inline_request_body : get_exploaded_request_body
  end

  def build_response
    @response = Response.new
    response.body = @is_inline? get_inline_response_body  : get_exploaded_response_body
    handle_resonse_array_type
  end

  def handle_resonse_array_type
    return if @config_yml["response"].blank?
    array_type = @config_yml["response"]["array_type"]
    return if array_type.blank?
    @response.is_column_array = true  if array_type.eql? "column"
    @response.is_row_array = true  if array_type.eql? "row"
  end


  def get_inline_response_body
    body = @config_yml["response"]["body"]
    return (body.nil?) ? "": (Parse.json_to_hash body)
  end

  def get_inline_request_body
    body = @config_yml["request"]["body"]
    if body.nil?
      return ""
    elsif body.class.name == "String"
      return Parse.json_to_hash body
    else
      @request.is_body_key_value = true
      return body
    end
  end

  def get_exploaded_request_body
    request_file = "#{File.dirname @config_yml_file}/request.json"
    return (File.exists? request_file) ? Parse.json_file_to_hash(request_file) : ""
  end

  def get_exploaded_response_body
    response_file = "#{File.dirname @config_yml_file}/response.json"
    return (File.exists? response_file)? Parse.json_file_to_hash(response_file) : ""
  end

end


class Request
  attr_accessor :url,:type,:query,:body,:is_body_key_value,:include_explicit_only
end

class Response 
  attr_accessor :body,:is_column_array,:is_row_array
end

