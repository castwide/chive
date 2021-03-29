require 'rails/generators'

module Chive
  module Generators
    class ControllersGenerator < Rails::Generators::Base

      module ModuleFunctions
        module_function

        def controller_path
          @controller_path ||= File.join(Chive::Engine.root, 'app', 'controllers')
        end
  
        def controller_names
          @controller_names ||= Dir[File.join(controller_path, 'chive', '*.rb')]
                                   .reject { |f| f.end_with?('application_controller.rb') }
                                   .map { |f| File.basename(f.gsub(/_controller\.rb$/, '')) }
        end  
      end

      include ModuleFunctions

      desc <<-DESC
Install the Chive controllers
      DESC

      # This option is not necessary while there is only one controller
      # class_option :only, type: :array, enum: ModuleFunctions.controller_names, default: [], desc: 'Select controllers (default is all)'

      def manifest
        puts 'running'
        controller_names.each do |name|
          # This option is not necessary while there is only one controller
          # next unless options[:only].empty? || file.start_with?(options[:only])
          copy_file "chive/#{name}_controller.rb", "app/controllers/chive/#{name}_controller.rb"
        end
      end

      private

      def source_paths
        [controller_path]
      end
    end
  end
end
