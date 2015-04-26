module StorytimeAdmin
  module Concerns
    module PolymorphicRouteGeneration
      def self.included(base)
        base.helper_method :polymorphic_route_components
      end
      
      def polymorphic_route_components(object_or_class_name)
        object = nil

        class_name = if object_or_class_name.is_a?(String)
          object = object_or_class_name.constantize
          object_or_class_name
        elsif object_or_class_name.is_a?(Class)
          object = object_or_class_name
          object_or_class_name.name
        else
          object = object_or_class_name
          object_or_class_name.class.name
        end
        
        pieces = class_name.split("::").map{|part| part.underscore.to_sym } 
        pieces.pop 
        pieces << object
      end
    end
  end
end