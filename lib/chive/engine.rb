require 'chive/ckeditor_authorization'

module Chive
  class Engine < ::Rails::Engine
    isolate_namespace Chive

    initializer 'chive.assets.precompile' do |app|
      app.config.assets.precompile += fetch_asset_names
    end

    private

    def fetch_asset_names
      Dir[File.join(
        Chive::Engine.root, 'app', 'assets', 'images', 'chive', '*'
        )].map { |f| "chive/#{File.basename(f)}" } +
        ['chive/application.css', 'chive/application.js'] +
        ['ckeditor/application.js', 'ckeditor/application.css', 'ckeditor/config.js']
    end
  end
end
