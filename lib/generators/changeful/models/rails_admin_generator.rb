require 'rails/generators/base'

module Changeful
  module Generators
    module Models
      class RailsAdminGenerator < Rails::Generators::Base # :nodoc:
        source_root File.expand_path('../../templates', __FILE__)

        def copy_changeful_rails_admin_model_file
          copy_file 'rails_admin.rb', 'app/models/changeful_content.rb'
        end
      end
    end
  end
end
