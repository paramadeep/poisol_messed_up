class ConfigMap
  @@config_file_map = {}

  def self.add map
    @@config_file_map.update map
  end

  def self.file class_name
    @@config_file_map[class_name]
  end

end
