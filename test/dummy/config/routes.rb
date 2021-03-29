Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Chive::Engine => "/chive"
end
