module ClassTemplate
  def generate_request_methods 
    @request_body = @config.request.body.deep_dup
    return if @request_body.nil?
    @request_body.each do |field|
      field_name = field[0]
      define_singleton_method("by_#{field[0].underscore}") do |*value|
        @request_body[field_name] = value[0]
        self
      end
    end
    @request_body = {} if @config.request.include_explicit_only
  end
end
