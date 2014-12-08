class StubFactory
  def build folder
    folder.chomp! '/'
    domain_config = Dir["#{folder}/domain.yml"].first
    explolded_configs =  Dir["#{folder}/**/config.yml"]
    inline_configs = Dir["#{folder}/**/*.yml"] - ( (explolded_configs.nil?) ?  [] : explolded_configs) - [domain_config]
    @domain = Domain.new.load domain_config
    generate_exploded_config explolded_configs unless explolded_configs.nil?
    generate_inline_config inline_configs unless inline_configs.nil?
  end

  private


  def generate_exploded_config explolded_configs
    explolded_configs.each do |config_file|
      dynamic_name = (FileName.get_dir_name config_file).camelize
      config = StubConfigBuilder.new.is_exploded.with_file(config_file).with_domain(@domain).build
      create_class dynamic_name,config
    end
  end

  def generate_inline_config inline_configs
    inline_configs.each do |config_file|
      dynamic_name = (FileName.get_file_name config_file).camelize
      config = StubConfigBuilder.new.is_inline.with_file(config_file).with_domain(@domain).build
      create_class dynamic_name,config
    end
  end

  def create_class class_name,config
    ConfigMap.add class_name => config
    Object.const_set class_name,Class.new {include ClassTemplate}
  end

end
