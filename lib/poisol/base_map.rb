class BaseMap
  @@base_file_map = {}

  def self.add map
    @@base_file_map.update map
  end

  def self.file class_name
    @@base_file_map[class_name]
  end
end
