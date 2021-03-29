require 'rails/generators'

module Chive
  module Generators
    class DeviseGemGenerator < Rails::Generators::Base

      # This is trivial enough that it doesn't need to clutter the generator
      # list. Its primary purpose is to assist the `chive:complete` rake task.
      hide!

      def manifest
        gem 'devise'
      end
    end
  end
end
