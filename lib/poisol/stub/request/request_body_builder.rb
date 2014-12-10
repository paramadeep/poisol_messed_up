module RequestBodyBuilder
  def generate_request_methods 
    request_body = @stub_config.request.body.deep_dup
    request_body.each do |field|
      field_name = field[0]
      define_method("by_#{field[0].underscore}") do |*value|
        @request.body[field_name] = value[0]
        self
      end
    end
  end
end
