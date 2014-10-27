module ClassTemplate

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

  def prepare_response
    @response_body = @config.response.body == "" ? "" : generate_response_methods
  end


  def build
    stub = stub_request(@type, "http://http//localhost:7098:80/#{@url}")
    stub.with(:query => @query) unless @query.eql? ""
    stub.with(:body => @request_body) unless @request_body.eql? ""
    stub.to_return(:status => 200, :body => @response_body, :headers => {})
  end

  def generate_query_methods
    @query = @config.request.query 
    @query.each do |field|
      define_singleton_method("by#{field[0].capitalize}") do |*value|
        @query[field[0]] = value[0]
        self
      end
    end
  end

  def generate_request_methods 
    @request_body = @config.request.body 
    return if @request_body.nil?
    @request_body.each do |field|
      define_singleton_method("by#{field[0].capitalize}") do |*value|
        @request_body[field[0]] = value[0]
        self
      end
    end
  end

  def generate_response_methods
    @response_body = @config.response.body
    return if @response_body.nil?
    if @config.response.array_type == "column_array"
      generate_response_for_column_array
    elsif @config.response.array_type == "row_array"
      generate_response_for_row_array
    else
      generate_response_for_object
    end
  end

  def generate_response_for_object
    @response_body.each do |field|
      define_singleton_method("has#{field[0].capitalize}") do |*value|
        value = value[0]
        if value.class.to_s == "String"
          @response_body[field[0]] = value
        elsif value.class.to_s == "Hash"
          @response_body[field[0]] = @response_body[field[0]].deep_merge value
        end
        self
      end
    end
  end

end
