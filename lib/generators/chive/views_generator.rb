require 'rails/generators'

module Chive
  module Generators
    class ViewsGenerator < Rails::Generators::Base

      module ModuleFunctions
        module_function

        def view_path
          @view_path ||= File.join(Chive::Engine.root, 'app', 'views')
        end
      end

      include ModuleFunctions

      desc <<-DESC
Install the Chive views
      DESC

      def manifest
        directory 'chive', 'app/views/chive'
      end

      private

      def source_paths
        [view_path]
      end
    end
  end
end
