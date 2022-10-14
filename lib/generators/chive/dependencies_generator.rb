require 'rails/generators'

module Chive
  module Generators
    # Install Chive's gem dependencies.
    #
    class DependenciesGenerator < Rails::Generators::Base

      def manifest
        gem 'acts-as-taggable-on'
        gem 'bootstrap'
        gem 'ckeditor'
        gem 'flatpickr'
        gem 'jquery-rails'
        gem 'mini_magick'
        gem 'will_paginate'
      end
    end
  end
end
