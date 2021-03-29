require 'rails/generators'
require 'active_record'
require 'rails/generators/active_record/migration'

module Chive
  module Generators
    class MigrationsGenerator < Rails::Generators::Base
      include ActiveRecord::Generators::Migration

      desc <<-DESC
Generate migrations for Chive.
      DESC

      def manifest
        Dir[File.join(migrations_path, '*.rb')]
          .map { |f| File.basename(f) }
          .each do |src|
            title = src.gsub /^[0-9]+_/, ''
            migration_template src, "db/migrate/#{title}", {
              migration_file_name: File.basename(src, '.rb')
            }
          end
      end

      private

      def source_paths
        @source_paths ||= [migrations_path]
      end

      def migrations_path
        File.join(Chive::Engine.root, 'db', 'migrate')
      end
    end
  end
end
