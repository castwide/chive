Chive::Engine.routes.draw do
  get '/', to: 'articles#index', as: 'articles'
  get '/:slug', to: 'articles#show', as: 'article', slug: :slug
end
