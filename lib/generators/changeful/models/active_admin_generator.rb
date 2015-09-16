require 'rails/generators/base'

module Changeful
  module Generators
    module Models
      class ActiveAdminGenerator < Rails::Generators::Base # :nodoc:
        source_root File.expand_path('../../templates', __FILE__)

        def copy_changeful_active_admin_model_file
          copy_file 'active_admin.rb', 'app/admin/changeful_content.rb'
        end
      end
    end
  end
end
