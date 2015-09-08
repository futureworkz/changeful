require 'rails/generators/base'

module Changeful
  module Generators
    class ModelGenerator < Rails::Generators::Base # :nodoc:
      source_root File.expand_path('../templates', __FILE__)

      def copy_changeful_model_file
        copy_file 'model.rb', 'app/models/changeful_content.rb'
      end
    end
  end
end
