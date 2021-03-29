require 'ckeditor'

module Chive
  class AuthorizationError < StandardError; end

  class CkeditorAuthorization
    def initialize controller
      @controller = controller
    end

    def authorize action, model_object = nil
      if Chive.use_devise?
        raise Chive::AuthorizationError unless @controller.chive_user
      elsif !Rails.env.development?
        raise Chive::AuthorizationError
      end
    end

    def authorize? action, model_object = nil
      if Chive.use_devise?
        !!@controller.chive_user
      else
        Rails.env.development?
      end
    end
  end
end

Ckeditor::AUTHORIZATION_ADAPTERS[:chive] = Chive::CkeditorAuthorization
