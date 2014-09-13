require 'webmock'
include WebMock::API
WebMock.disable_net_connect!(:allow_localhost => true)

require_relative './config_map'
require_relative './class_template'
require_relative './utils/file_util'
require_relative './utils/parse'

class Factory
  def self.build folder
    folder.chomp! '/'
    Dir["#{folder}/**/config.yml"].each do |config_file|
      dynamic_name = FileUtil.titilze_parent_dir config_file
      ConfigMap.add dynamic_name => config_file
      Object.const_set dynamic_name,Class.new {include ClassTemplate}
    end
  end
end
