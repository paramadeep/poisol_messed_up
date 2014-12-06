class StubConfig
  attr_accessor :response,:request,:is_inline,:file
end

class RequestConfig
  attr_accessor :domain,:url,:type,:query,:body,:is_body_key_value,:include_explicit_only
end

class ResponseConfig
  attr_accessor :body,:is_column_array,:is_row_array
end
