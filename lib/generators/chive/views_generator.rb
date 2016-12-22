module Chive
  class ViewsGenerator < Rails::Generators::Base
    def generate_views
      FileUtils.cp_r File.join(Chive::Engine.root, 'app', 'views', 'chive'), File.join(Rails.root, 'app', 'views', 'chive')
    end
  end
end
