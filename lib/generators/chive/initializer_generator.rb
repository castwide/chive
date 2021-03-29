require 'rails/generators'

module Chive
  module Generators
    class InitializerGenerator < Rails::Generators::Base

      desc <<-DESC
Generate Chive initializer.
      DESC

      class_option :devise, type: :boolean, default: false, desc: "Use Devise"

      def manifest
        template 'chive.rb.tt', 'config/initializers/chive.rb'
      end

      private

      def source_paths
        @source_paths ||= [File.join(Chive::Engine.root, 'templates')]
      end
    end
  end
end
