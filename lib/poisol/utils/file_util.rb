class FileUtil

  def self.titilze_parent_dir file_name
    titilize File.basename(File.dirname file_name)
  end

  def self.titilze_file_name file_name
    titilize ((File.basename file_name).chomp ".yml")
  end

  private 

  def self.titilize input
    (input).capitalize.split('_').reduce{|c,a| c+a.capitalize}
  end

end

