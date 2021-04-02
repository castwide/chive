module Chive
  module UserConcerns
    extend ActiveSupport::Concern

    included do
      helper_method :user_can_chive?
      helper_method :chive_user
    end

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

    def user_can_chive?
      if Chive.use_devise?
        user_signed_in?
      else
        Rails.env.development?
      end
    end
  end
end
