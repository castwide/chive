module Chive
  module ApplicationHelper
    # Needed to fix polymorphic_mappings.
    # @see https://github.com/rails/rails/issues/31325#issuecomment-560135329
    def method_missing(method, *args, &block)
      if method.to_s.end_with?("_path", "_url")
        if main_app.respond_to?(method)
          main_app.send(method, *args)
        else
          super
        end
      else
        super
      end
    end

    # Needed to fix polymorphic_mappings.
    # @see https://github.com/rails/rails/issues/31325#issuecomment-560135329
    def respond_to?(method)
      if method.to_s.end_with?("_path", "_url")
        if main_app.respond_to?(method)
          true
        else
          super
        end
      else
        super
      end
    end
  end
end
