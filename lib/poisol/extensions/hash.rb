class Hash 
  def camelize_keys
    Hash[
      self.map do |key,value| 
        value = value.camelize_keys if value.class.name.eql?("Hash")
        [key.to_s.camelize(:lower),value ]
      end
    ]
  end
end

