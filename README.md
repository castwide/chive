# Chive

A mountable blog engine for Rails.

*This project is still in early development.*

## Features

* Configurable publication and expiration dates
* Paginated archives
* Automated article summaries
* RSS feed

## Installation

Add chive to your Gemfile:

    gem 'chive', git: 'https://github.com/castwide/chive'

Run the migrations:

    $ rails chive:install:migrations
    $ rake db:migrate

Add the Chive engine to config/routes.rb:

    mount Chive::Engine, at: "/blog"

## Configuration

See config/initializers/chive.rb for configuration options.

## Adding an RSS Feed

Add the feed to config/routes.rb:

    get '/rss' => 'chive/articles#feed', defaults: { format: 'rss' }

## Editing Views

Chive provides a generator for copying its views to your Rails app:

    $ rails generate chive:views

This will add the following views to your app:

* chive/articles/index.html.erb   - The blog's home page
* chive/articles/show.html.erb    - The view for individual articles
* chive/articles/feed.rss.builder - The RSS feed
* chive/articles/_list.html.erb   - A brief article listing

## Adding a List of Articles to Views

There are two basic ways to include a list of articles in your views and
layouts.

### 1. The List Partial

Add the list partial to any view with the render method:

    render partial: 'chive/articles/list'
    
See "Editing Views" above to customize the list.

### 2. The article_list Helper Method

You can also code your own listings into any view with the article_list method.
Here's a simple example:

    <% article_list.each do |article| %>
      <p>
        Title: <%= article.title %><br/>
        Link: <%= link_to article_path(article) %>
      </p>
    <% end %>

#### article_list Arguments

##### Limit

The maximum number of articles to select. Example:

    article_list(limit: 5)

## Administration

The simplest option for administration is to add the chive_admin gem to your
project.

Chive is designed to be as simple and as modular as possible, so chive_admin
is not required. You can build your own control panel or integrate Chive into
an existing one instead.
