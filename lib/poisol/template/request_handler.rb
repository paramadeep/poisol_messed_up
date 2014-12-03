module ClassTemplate
    def ClassTemplate.generate_request_methods 
      @request_body = @config.request.body.clone
      return if @request_body.nil?
      @request_body.each do |field|
        define_singleton_method("by_#{field[0].underscore}") do |*value|
          @request_body[field[0]] = value[0]
          self
        end
      end
    end
end
