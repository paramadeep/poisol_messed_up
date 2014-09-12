require 'yaml'
require 'recursive-open-struct'
require 'json'

class Parse
  def self.json_file file_name
    RecursiveOpenStruct.new(JSON.parse(File.open(file_name,"r")),:recurse_over_arrays => true)
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
    RecursiveOpenStruct.new(YAML.load_file(file_name),:recurse_over_arrays => true) 
  end

end

