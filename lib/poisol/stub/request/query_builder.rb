module QueryBuilder
    def generate_query_methods
      query = @stub_config.request.query 
      query.each do |field|
        define_method("for_#{field[0]}") do |*value|
          @request.query[field[0]] = value[0]
          self
        end
      end
    end
end
