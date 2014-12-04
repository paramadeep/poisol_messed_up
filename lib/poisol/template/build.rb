module ClassTemplate
  def build
    build_url
    build_query
    build_request_body
    build_response_body
  end

  def build_url
    remove_path_param_name_from_url
    @stub = stub_request(@type, "http://#{@config.request.domain}/#{@url}")
  end

  def build_query
    @stub.with(:query => @query) unless @query.eql? ""
  end

  def build_request_body
    return if  @request_body.blank? 
    @request_body =  Parse.hash_to_concatenated_key_value(@request_body) if @config.request.is_body_key_value
    @stub.with(:body => @request_body)
  end

  def build_response_body
    @response_body = Parse.hash_array_to_column_hash(@response_body) if @config.response.is_column_array
    @stub.to_return(:status => 200, :body => @response_body.to_json, :headers => {'Content-Type' => 'application/json'})
  end
end

