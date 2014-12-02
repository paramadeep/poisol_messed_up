module ClassTemplate
  attr_accessor :response_body

  def initialize
    @config = ConfigMap.file self.class.name
    prepare_request
    prepare_response
  end

  def prepare_request
    prepare_request_url
    prepare_request_query
    prepare_request_body
  end

  def prepare_request_url
    @url = @config.request.url
    @type = @config.request.type
  end

  def prepare_request_query
    @query = (@config.request.query.nil?) ? "" : generate_query_methods
  end

  def prepare_request_body
    @request_body = @config.request.body == "" ? "" : generate_request_methods
  end

  def build
    stub = stub_request(@type, "http://#{Domain.base_url}/#{@url}")
    stub.with(:query => @query) unless @query.eql? ""
    stub.with(:body => @request_body) unless @request_body.eql? ""
    if @config.response.array_type == "column_array"
      @response_body = Parse.hash_array_to_column_hash(@response_body)
    end
    stub.to_return(:status => 200, :body => @response_body.to_s, :headers => {})
  end

end
