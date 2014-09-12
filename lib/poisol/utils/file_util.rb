class FileUtil

  def self.titilze_parent_dir file_name
      (File.basename (File.dirname file_name)).capitalize.split('_').reduce{|c,a| c+a.capitalize}
  end

end

