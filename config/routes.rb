StorytimeAdmin::Engine.routes.draw do
  StorytimeAdmin.models.each do |model|
    if model.include?("::")      
      components = model.tableize.split("/")
      resource_name = components.pop
      namespace(components.join("/")){ resources resource_name }
    else
      resources model.tableize.to_sym
    end
  end
end