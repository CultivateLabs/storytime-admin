Rails.application.routes.draw do
  root to: "admin/home#index"
  devise_for :users
  mount Admin::Engine => "/admin"
end