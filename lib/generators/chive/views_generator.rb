module Chive
  class ViewsGenerator < Rails::Generators::Base
    source_root Chive::Engine.root
    def generate_views
      directory File.join('app', 'views', 'chive'), File.join(Rails.root, 'app', 'views', 'chive')
    end
  end
end
