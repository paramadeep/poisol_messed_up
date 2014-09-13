class ConfigMap
  @@config_file_map = {}

  def self.add map
    @@config_file_map.update map
  end

  def self.file class_name
    @@config_file_map[class_name]
  end

  def self.request class_name
    FileUtil.getRequest @@config_file_map[class_name]
  end

  def self.response class_name
    FileUtil.getResponse @@config_file_map[class_name]
  end

end
