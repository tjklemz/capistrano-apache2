module Capistrano
  module Apache2
    module Generators
      class ConfigGenerator < Rails::Generators::Base
        desc "Create local apache2 configuration file for customization"
        source_root File.expand_path('../templates', __FILE__)

        def copy_template
          copy_file "_apache2_conf.erb", "config/deploy/apache2_conf.erb"
        end
      end
    end
  end
end
