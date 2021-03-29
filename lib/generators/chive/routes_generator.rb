require 'rails/generators'

module Chive
  module Generators
    class RoutesGenerator < Rails::Generators::Base

      desc 'Install the default routes'

      def manifest
        inject_into_file 'config/routes.rb', after: "Rails.application.routes.draw do\n" do
          "  mount Chive::Engine => '/chive'\n"
        end
      end
    end
  end
end
