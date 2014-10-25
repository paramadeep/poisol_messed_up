require 'yaml'
require 'json'

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

end

