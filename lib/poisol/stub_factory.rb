require_relative './config_map'
require_relative './stub_config'
require_relative './class_template'
require_relative './utils/file_util'
require_relative './utils/parse'

class StubFactory
  def build folder
    folder.chomp! '/'
    explolded_configs =  Dir["#{folder}/**/config.yml"]
    inline_configs = Dir["#{folder}/**/*.yml"] - ( (explolded_configs.nil?) ?  [] : explolded_configs)
    generate_exploded_config explolded_configs unless explolded_configs.nil?
    generate_inline_config inline_configs unless inline_configs.nil?
  end

  private

  def generate_exploded_config explolded_configs
    explolded_configs.each do |config_file|
      dynamic_name = FileUtil.titilze_parent_dir config_file
      config = StubConfig.new.is_exploded.with_file(config_file).build
      create_class dynamic_name,config
    end
  end

  def generate_inline_config inline_configs
    inline_configs.each do |config_file|
      dynamic_name = FileUtil.titilze_file_name config_file
      config = StubConfig.new.is_inline.with_file(config_file).build
      create_class dynamic_name,config
    end
  end

  def create_class class_name,config
    ConfigMap.add class_name => config
    Object.const_set class_name,Class.new {include ClassTemplate}
  end

end
