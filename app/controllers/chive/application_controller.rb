module Chive
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    config.to_prepare do
      ApplicationController.helper Chive::ArticlesHelper
    end
  end
end
