# Use this hook to configure Chive.
# Be sure to restart your server when you modify this file.
#
Chive.setup do |config|
  # The model for the user.
  # config.user_model = 'User'

  # The user model's primary key.
  # config.user_pk_attr = 'id'

  # The user name attribute in the user model.
  # config.user_name_attr = 'name'

  # If the main app uses Devise, set this attribute to `true` for quick and
  # easy user authentication. The `Chive.user_model` attribute should use the
  # same model as Devise.
  # config.use_devise = false
  config.use_devise = false

  # The layout to use for public pages
  # config.public_layout = 'chive/application'

  # The slug formatter. This proc should generate a unique param for the
  # article's URL, e.g., `my-article-title`
  # config.slug_formatter = proc { |article| article.title.parameterize }

  # The number of articles to display per page
  # config.per_page = 10
end
