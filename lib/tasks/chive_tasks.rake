# desc "Explaining what the task does"
# task :chive do
#   # Task goes here
# end

namespace :chive do
  task :shared_install do
    sh 'rails generate chive:dependencies'
    sh 'rails generate chive:ckeditor'
    sh 'rake active_storage:install'
    sh 'rails generate chive:migrations'
    sh 'rails generate chive:routes'
    # The acts_as_taggable_on task needs to be the last migration. For some
    # reason it can cause duplicate migration numbers
    sh 'rake acts_as_taggable_on_engine:install:migrations'
  end

  desc 'Install Chive with minimum requirements'
  task :install do
    Rake::Task['chive:shared_install'].execute
    sh 'rails generate chive:initializer'
  end

  desc 'Install Chive with Devise'
  task :complete do
    sh 'rails generate chive:devise_gem'
    sh 'rails generate chive:devise'
    Rake::Task['chive:shared_install'].execute
    sh 'rails generate chive:seeds'
    sh 'rails generate chive:initializer --devise'
  end
end
