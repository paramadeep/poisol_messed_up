module ClassTemplate
    def generate_query_methods
      @query = @config.request.query 
      @query.each do |field|
        define_singleton_method("by#{field[0].capitalize}") do |*value|
          @query[field[0]] = value[0]
          self
        end
      end
    end
end
