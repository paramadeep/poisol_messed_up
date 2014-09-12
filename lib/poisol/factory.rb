require 'yaml'
require 'recursive-open-struct'
require 'webmock'
require_relative './class_template'
require_relative './config_map'

include WebMock::API
WebMock.disable_net_connect!(:allow_localhost => true)


class Factory
  def self.build folder
    folder.chomp! '/'
    Dir["#{folder}/**/config.yml"].each do |config_file|
      dynamic_name = (File.basename (File.dirname config_file)).capitalize.split('_').reduce{|c,a| c+a.capitalize}
      ConfigMap.add dynamic_name => config_file
      Object.const_set dynamic_name,Class.new {
        include ClassTemplate
      }
    end
  end
end
