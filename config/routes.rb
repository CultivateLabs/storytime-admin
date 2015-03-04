Admin::Engine.routes.draw do
  Admin.models.each do |model|
    resources model.tableize.to_sym
  end
end