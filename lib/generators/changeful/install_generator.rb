require 'rails/generators/base'
require 'rails/generators/active_record'

module Changeful
  module Generators
    class InstallGenerator < Rails::Generators::Base # :nodoc:
      include Rails::Generators::Migration

      def copy_changeful_migration
        migration_template 'migration.rb',
                           'db/migrate/create_changeful_contents.rb'
      end

      def self.source_root
        File.dirname(__FILE__) + '/templates'
      end

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end
    end
  end
end
