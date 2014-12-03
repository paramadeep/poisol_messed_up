module ClassTemplate
  def generate_methods_to_alter_path_params
    @url = @config.request.url.clone
    @url.scan(/{(.+?)}/).each do |path_params| 
      path_param = path_params[0]
      param_name = path_param.split("|")[0]
      param_default_value = path_param.split("|")[1]
      @url = @url.sub("{#{path_param}}",param_default_value)
      method_name = "for_#{param_name.underscore}"
      define_singleton_method(method_name) do |*input_value|
        input_value = input_value[0]
        @url = @url.sub("#{param_default_value}",input_value) unless input_value.blank?
        self
      end
    end
  end
end
