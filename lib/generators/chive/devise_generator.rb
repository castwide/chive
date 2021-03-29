require 'rails/generators'
require 'active_record'
require 'rails/generators/active_record/migration'

module Chive
  module Generators
    class DeviseGenerator < Rails::Generators::Base
      include ActiveRecord::Generators::Migration

      desc <<-DESC
Install Devise with Chive defaults.
      DESC

      class_option :user, type: :string, default: 'User', desc: 'The user model'

      def manifest
        Rails::Generators.invoke 'devise:install', [], behavior: behavior
        # @todo The User model should be configurable
        Rails::Generators.invoke 'devise', [options[:user]], behavior: behavior
        # @todo Adding a name may or may not be necessary
        migration_template 'add_name_to_devise.rb.tt', "db/migrate/add_name_to_#{options[:user].downcase.pluralize}.rb", {
          migration_file_name: "add_name_to_#{options[:user].downcase.pluralize}"
        }
      end

      private

      def source_paths
        @source_paths ||= [File.join(Chive::Engine.root, 'templates')]
      end

      def user
        options[:user].camelize.singularize
      end
    end
  end
end
