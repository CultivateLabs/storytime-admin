StorytimeAdmin::Engine.routes.draw do
  StorytimeAdmin.models.each do |model|
    resources model.tableize.to_sym
  end
end