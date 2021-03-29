require 'rails/generators'
require 'ckeditor' # @todo Code smell: should this need to be here?

module Chive
  module Generators
    class CkeditorGenerator < Rails::Generators::Base

      desc <<-DESC
Install CKEditor for Chive.
      DESC

      def manifest
        gem 'ckeditor'
        Rails::Generators.invoke 'ckeditor:install', ['--orm=active_record', '--backend=active_storage'], behavior: behavior

        inject_into_file 'config/initializers/ckeditor.rb', after: "config.authorize_with :cancancan\n" do
          <<-RUBY
  # This setting uses Chive's default authorization.
  config.authorize_with :chive
          RUBY
        end

        inject_into_file 'app/controllers/application_controller.rb', after: "class ApplicationController < ActionController::Base\n" do
          <<-RUBY
  include Chive::UserConcerns
          RUBY
        end
      end
    end
  end
end
