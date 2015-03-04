Rails.application.routes.draw do
  root to: "application#home"
  devise_for :users
  mount Admin::Engine => "/admin"
end