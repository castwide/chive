Chive::Engine.routes.draw do
  resources :articles, path: '/', param: :slug
end
