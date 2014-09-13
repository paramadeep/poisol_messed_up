require 'yaml'
require 'recursive-open-struct'
require 'json'

class Parse

  def self.json_file_to_hash file_name
    JSON.parse File.read(file_name)
  end 

  def self.json_file_to_object file_name
    hashMap = JSON.parse File.read(file_name)
    RecursiveOpenStruct.new hashMap,:recurse_over_arrays => true
  end 


  def self.to_json input
    input.to_hash.to_json
  end 

  def self.hash_to_json input_as_array
    collection = []
    input_as_array.each{|input| collection << (input.to_hash)}
    collection.to_json
  end 

  def self.yaml_file file_name
    hashMap = YAML.load_file(file_name)
    RecursiveOpenStruct.new hashMap,:recurse_over_arrays => true
  end

end

