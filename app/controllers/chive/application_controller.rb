module Chive
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    helper :all
  end
end
