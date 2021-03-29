require 'ostruct'

module Chive
  class ApplicationController < ActionController::Base
    include Chive::UserConcerns

    protect_from_forgery with: :exception

    after_action :store_action

    # Needed to fix polymorphic_mappings.
    # @see https://github.com/rails/rails/issues/31325#issuecomment-560135329
    before_action :import_main_app_polymorphic_mappings

    private

    # Needed to fix polymorphic_mappings.
    # @see https://github.com/rails/rails/issues/31325#issuecomment-560135329
    def import_main_app_polymorphic_mappings
      Chive::Engine.routes.polymorphic_mappings.merge! Rails.application.routes.polymorphic_mappings
    end

    def store_action
      return unless request.get?
      if (request.path != "/users/sign_in" &&
          request.path != "/users/sign_up" &&
          request.path != "/users/password/new" &&
          request.path != "/users/password/edit" &&
          request.path != "/users/confirmation" &&
          request.path != "/users/sign_out" &&
          !request.xhr?) # don't store ajax calls
        store_location_for(Chive.user_model.underscore.to_sym, request.fullpath)
      end
    end
  end
end
