module Chive
  module ArticlesHelper
    def user_can_chive?
      if Chive.use_devise?
        user_signed_in?
      else
        Rails.env.development?
      end
    end
  end
end
