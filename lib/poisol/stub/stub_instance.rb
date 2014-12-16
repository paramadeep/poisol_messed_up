module StubInstance
  def initialize
    @request = Request.new
    @response = Response.new
    @request.url = stub_config.request.url.deep_dup
    @request.query = stub_config.request.query.deep_dup
    @request.query = {} if stub_config.request.query_explicit
    @request.body = stub_config.request.body.deep_dup
    @request.body = {} if stub_config.request.body_explicit
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

  def has input_hash
    @response.body.deep_merge! input_hash
    self
  end

  def  for input_hash
    @request.query.deep_merge! input_hash
    self
  end

end
