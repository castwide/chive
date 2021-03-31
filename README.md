# Chive

A mountable blog engine for Rails.

## Quick Start

Add this line to your application's Gemfile:

    ```bash
    gem 'chive'
    ```

Run the rake task for a complete installation:

    ```bash
    $ rake chive:complete
    ```

The complete installation includes Devise for user authentication. Alternatively, you can run `rake chive:install` to get the minimum requirements without Devise.

Next, run the database migrations:

    ```bash
    $ rake db:migrate
    ```

If you installed with `rake:complete`, you can seed the database with an example user and article:

    ```bash
    $ rake db:seed
    ```

Start the server:

    ```bash
    $ rails s
    ```

Browse to `http://localhost:3000/chive`. You should see the article index page.

If you installed with `rake:complete`, go to `http://localhost:3000/users/sign_in` and log in with email `example@example.com` and password `password`.

If you don't have user authentication configured, you'll still be able to test the admin features in development mode. For security purposes, you're required to supply an authentication implementation for the admin pages to work in production.

## Custom Setup

If you want to customize Chive or to integrate it into an existing app, you can follow these steps to get it working.

### Add the gem dependencies to the Gemfile

Install the minimum dependencies:

  ```bash
  $ rails g chive:dependencies
  $ bundle install
  ```

### Install and configure CKEditor

The default:

```bash
$ rails g chive:ckeditor
$ rake active_storage:install
```

The default CKEditor configuration uses ActiveRecord and ActiveStorage to store images and attachments. You can select different options by running `rails g ckeditor:install` instead. See the [CKEditor gem](https://github.com/galetahub/ckeditor) for more information.

To use Chive's default authorization for uploading files through CKEditor, add this line to `config/initializers/ckeditor.rb`:

```ruby
config.authorize_with :chive
```

### Generate the initializer

```bash
rails g chive:initializer
```

### Install the migrations

```bash
rake chive:install:migrations
rake acts_as_taggable_on_engine:install:migrations
```

### Users

Chive requires a users table for authors. The default installation uses [Devise](https://github.com/heartcombo/devise). To install Devise with Chive's defaults:

```bash
rails g chive:devise
```

If you want to use an existing Devise setup or an alternative user system, update `config/initializers/chive.rb` to point to your user model. Note that Chive requires the user model to include a `name` attribute.

### Authentication

If you're using Devise you can get quick and easy authentication with the `use_devise` option in `config/initializers/chive.rb`:

```ruby
config.use_devise = true
```

To customize authentication, you'll need to modify the controllers. Add them to your `app/controllers` directory:

```bash
rails g chive:controllers
```

### Mounting the engines

The default routes in `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Chive::Engine => "/chive"

  # ...etc.
end
```

You can make the blog your home page by changing the `Chive::Engine` path to `/`:

```ruby
Rails.application.routes.draw do

  # [...etc.]

  # If you mount Chive on the home page, make sure it's the last route you
  # define. Otherwise `Chive::Engine#index` will process all your website's
  # paths before the other routes have a chance to evaluate them.
  mount Chive::Engine => '/'
end
```

## Customizing the Layout

There are a few different options for modifying the look and feel of Chive pages.

The `config.public_layout` setting in `config/initializers/chive.rb` lets you change the layout used by public pages (i.e., `Chive::Articles#index` and `Chive::Articles#show`). This is useful for applying your own style to the main site while still using the standard admin pages for content management.

To modify the views, add them to your `app/views` directory:

```bash
rails generate chive:views
```

## Creating Your Own Resource

Another option for customizing your blog is to create a custom resource.

Make your own controller, e.g., `apps/controller/blog_controller.rb`:

```ruby
class BlogController < Chive::ArticlesController
  layout 'application'
end
```

The `layout` call makes your controller use your `app/views/layout/application` layout instead of the engine's.

Add a new path to `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  # ...
  resources :blog, path: '/blog', controller: 'blog', only: [:index, :show]
  # ...
end
```

The `only: [:index, :show]` option limits the resource to the public pages.

Now you can make your own views at `app/views/blog/index.html.erb` and `app/views/blog/show.html.erb`.

## Third-Party Libraries

Chive uses the following libraries and plugins:

- acts-as-taggable-on
- bootstrap
- ckeditor
- jquery-rails
- will_paginate
