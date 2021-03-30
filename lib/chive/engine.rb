require 'chive/ckeditor_authorization'

module Chive
  class Engine < ::Rails::Engine
    isolate_namespace Chive

    initializer 'chive.assets.precompile' do |app|
      app.config.assets.precompile += fetch_asset_names
    end

    rake_tasks do
      load Chive::Engine.root.join('lib', 'tasks', 'chive_tasks.rake')

      if Rake::Task.task_defined?('assets:precompile')
        Rake::Task['assets:precompile'].enhance do
          Rake::Task['chive:public_assets'].invoke
        end
      end
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
