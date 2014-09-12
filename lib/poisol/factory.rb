require 'yaml'
require 'recursive-open-struct'
require 'webmock'
require_relative './class_template'
require_relative './base_map'

include WebMock::API
WebMock.disable_net_connect!(:allow_localhost => true)


class Factory
  def self.build folder
    folder.chomp! '/'
    Dir["#{folder}/**/base.yml"].each do |base_file|
      dynamic_name = (File.basename (File.dirname base_file)).capitalize.split('_').reduce{|c,a| c+a.capitalize}
      BaseMap.add dynamic_name => base_file
      Object.const_set dynamic_name,Class.new {
        include ClassTemplate
      }
    end
  end
end
