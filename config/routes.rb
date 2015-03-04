Admin::Engine.routes.draw do
  Admin.models.each do |model|
    resources model.tableize.to_sym, model_name: model, controller: (File.exist?(Rails.root.join("app", "controllers", "admin", "#{model.tableize}_controller.rb")) ? model.tableize : "application")
  end
end