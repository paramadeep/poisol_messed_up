module ClassTemplate

  def prepare_response
    return if @config.response.body.blank?
    @config.response.array_type.blank? ? generate_methods_to_alter_response_object : generate_methods_to_alter_response_array
  end

  def generate_methods_to_alter_response_array
    @response_body_object = @config.response.body
    @response_body = []
    generate_method_to_append_response_array
    generate_method_to_alter_response_array_object
  end

  def generate_method_to_alter_response_array_object
    @response_body_object.each do |field|
      field_name = field[0]
      actual_field_value = field[1]
      define_singleton_method("with_#{field_name.underscore}") do |*input_value|
        input_value = input_value[0]
        @response_body.last[field_name] = actual_field_value.class.to_s == "Hash" ? response_body.last[field_name].merge(input_value) : input_value
        self
      end
    end
  end

  def generate_method_to_append_response_array
    object_name = self.class.to_s.classify.underscore
    method_name = "has_#{object_name}"
    define_singleton_method(method_name) do
      @response_body.append @response_body_object
      self
    end
    alias_name = "has_another_#{object_name}"
    #alias_method alias_name.intern,method_name.intern
    #alias_method method_name.intern,alias_name.intern
  end

  def generate_methods_to_alter_response_object
    @response_body = @config.response.body
    @response_body.each do |field|
      field_name = field[0]
      actual_field_value = field[1]
      define_singleton_method("has_#{field_name.underscore}") do |*input_value|
        input_value = input_value[0]
        @response_body[field_name] = actual_field_value.class.to_s == "Hash" ? @response_body[field_name].deep_merge(input_value) : input_value
        self
      end
    end
  end

end
