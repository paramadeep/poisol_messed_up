module ClassTemplate

  def prepare_response
    return if @config.response.body.blank?
    if  @config.response.is_column_array or @config.response.is_row_array 
      generate_methods_to_alter_response_array
    else
      generate_methods_to_alter_response_object 
    end
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
    @response_body = @config.response.body.clone
    @response_body.each do |field|
      field_name = field[0]
      actual_field_value = field[1]
      is_array = (actual_field_value.class.to_s == "Array")
      if is_array 
        generate_method_to_alter_response_field_array field_name,actual_field_value
      else 
        generate_method_to_alter_response_field field_name,actual_field_value
      end

    end
  end

  def generate_method_to_alter_response_field_array field_name,actual_field_values
    actual_field_value = actual_field_values[0] 
    method_name = "has_#{field_name.classify.underscore}" 
    define_singleton_method(method_name) do |*input_value|
      input_value = input_value[0]
      assignment_value = get_assignment_value actual_field_value,input_value
      @response_body[field_name] =  [assignment_value]
      self
    end

    method_name = "has_another_#{field_name.classify.underscore}" 
    define_singleton_method(method_name) do |*input_value|
      input_value = input_value[0]
      assignment_value = get_assignment_value actual_field_value,input_value
      @response_body[field_name] =  @response_body[field_name] << assignment_value 
      self
    end

    method_name = "has_no_#{field_name.classify.underscore}" 
    define_singleton_method(method_name) do 
      @response_body[field_name] = [] 
      self
    end
  end

  def generate_method_to_alter_response_field field_name,actual_field_value
    method_name = "has_#{field_name.underscore}"
    self.class.send(:define_method, method_name) do |*input_value|
      input_value = input_value[0]
      assignment_value = get_assignment_value actual_field_value,input_value
      @response_body[field_name] = assignment_value
      self
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
