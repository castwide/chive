module Chive
  module UserConcerns
    extended ActiveSupport::Concern

    def authenticate_chive_user
      if Chive.use_devise?
        send("authenticate_#{Chive.user_model.underscore}!")
      elsif Rails.env.development?
          flash[:alert] = "Warning: Authentication is not implemented. Access to admin pages is enabled in development only."
      else
        # @todo super or raise or something?
        raise "Authentication is not implemented"
      end
    end

    def chive_user
      send("current_#{Chive.user_model.underscore}") if Chive.use_devise?
    end
  end
end
