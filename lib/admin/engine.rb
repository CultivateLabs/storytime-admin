require 'haml-rails'
require 'sass-rails'
require 'font-awesome-sass'
require 'coffee-rails'
require 'jquery-rails'
require 'devise'
require 'simple_form'
require 'leather'
require 'kaminari'
require 'bootstrap-kaminari-views'

module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin
  end
end
