require 'haml-rails'
require 'sass-rails'
require 'font-awesome-sass'
require 'coffee-rails'
require 'jquery-rails'
require 'simple_form'
require 'leather'
require 'kaminari'
require 'bootstrap-kaminari-views'
require 'storytime_admin/to_csv'
require 'csv'

module StorytimeAdmin
  class Engine < ::Rails::Engine
    isolate_namespace StorytimeAdmin

    initializer "storytime_admin.controller_helpers" do
      ActiveSupport.on_load(:action_controller) do
        include StorytimeAdmin::Concerns::PolymorphicRouteGeneration
      end
    end
  end
end
