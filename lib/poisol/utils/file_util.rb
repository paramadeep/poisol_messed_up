class FileUtil

  def self.titilze_parent_dir file_name
      (File.basename (File.dirname file_name)).capitalize.split('_').reduce{|c,a| c+a.capitalize}
  end

  def self.getRequest file_name
    "#{File.dirname file_name}/request.json"
  end

  def self.getResponse file_name
    "#{File.dirname file_name}/response.json"
  end
end

