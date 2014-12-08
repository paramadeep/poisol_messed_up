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
    generate_methods_to_alter_path_params
    @type = @config.request.type
  end

  def prepare_request_query
    generate_query_methods if @config.request.query.present?
  end

  def prepare_request_body
    generate_request_methods if @config.request.body.present?
  end

end
