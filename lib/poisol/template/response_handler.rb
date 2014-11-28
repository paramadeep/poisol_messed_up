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
      is_array = (actual_field_value.class.to_s == "Array")
      actual_field_value = actual_field_value[0] if is_array
      @response_body.last[field_name] = [] if is_array
      method_name = is_array ? ("with_#{field_name.classify.underscore}") : ("with_#{field_name.underscore}")
      define_singleton_method(method_name) do |*input_value|
        input_value = input_value[0]
        assignment_value = get_assignment_value actual_field_value,input_value
        @response_body.last[field_name] = is_array ? (@response_body.last[field_name] << assignment_value) :  assignment_value
        self
      end
    end
  end

  def generate_method_to_append_response_array
    object_name = self.class.to_s.classify.underscore
    method_name = "has_#{object_name}"
    define_singleton_method(method_name) do
      @response_body << @response_body_object.deep_dup
      self
    end
  end

  def generate_methods_to_alter_response_object
    @response_body = @config.response.body
    @response_body.each do |field|
      field_name = field[0]
      actual_field_value = field[1]
      is_array = (actual_field_value.class.to_s == "Array")
      @response_body[field_name] = [] if is_array
      actual_field_value = actual_field_value[0] if is_array
      method_name = is_array ? ("has_#{field_name.classify.underscore}") : ("has_#{field_name.underscore}")
      define_singleton_method(method_name) do |*input_value|
        input_value = input_value[0]
        assignment_value = get_assignment_value actual_field_value,input_value
        @response_body[field_name] = is_array ? (@response_body[field_name] << assignment_value) :  assignment_value
        self
      end
    end
  end

  def get_assignment_value actual_field_value,input_value
    if  actual_field_value.class.to_s == "Hash" 
      input_value = {} if input_value.blank?
      actual_field_value.deep_merge(input_value) 
    else
      input_value
    end
  end

end