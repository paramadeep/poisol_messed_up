class Parse

  def self.json_file_to_hash file_name
    JSON.parse File.read(file_name)
  end 

  def self.yaml_file file_name
    YAML.load_file(file_name)
  end

  def self.json_to_hash json
    JSON.parse json
  end

  def self.hash_array_to_column_hash hash_array
    column_hash = Hash.new
    hash_array[0].each_key { |key| column_hash.merge!(key=>[])}
    hash_array.each do |hash|
      column_hash.each_key {|key| column_hash[key].append hash[key]}
    end
    return column_hash
  end

end

