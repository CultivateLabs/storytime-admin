Rails.application.routes.draw do
  root to: "application#home"
  devise_for :users
  mount StorytimeAdmin::Engine => "/admin"
end