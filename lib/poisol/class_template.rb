module ClassTemplate

  def initialize
    @config_file = ConfigMap.file self.class.name
    prepare_request
    prepare_response
    prepare_url
  end

  def prepare_url
    config = Parse.yaml_file @config_file
    @url = config.request.url
    @type = config.request.type.intern
    @params = config.request.params
  end

  def prepare_request
    request_file = "#{File.dirname @config_file}/request.json"
    if File.exists? request_file 
      @request = Parse.json_file_to_hash request_file
      generate_request_methods
    else
      @request = ""
    end
  end

  def prepare_response
    response_file = "#{File.dirname @config_file}/response.json"
    if File.exists? response_file 
      @response = Parse.json_file_to_hash response_file
      generate_response_methods
    else
      @response = ""
    end
  end


  def build
    stub = stub_request(@type, "http://http//localhost:7098:80/#{@url}")
    stub.with(:query => @params) unless @params.eql? ""
    stub.with(:body => @request) unless @request.eql? ""
    stub.to_return(:status => 200, :body => @response, :headers => {})
  end

  def generate_request_methods 
    @request.each do |field|
      define_singleton_method("by#{field[0].capitalize}") do |*value|
        @request[field[0]] = value[0]
        self
      end
    end
  end

  def generate_response_methods
    @response.each do |field|
      define_singleton_method("has#{field[0].capitalize}") do |*value|
        @response[field[0]] = value[0]
        self
      end
    end
  end

end

