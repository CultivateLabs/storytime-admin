module Admin
  module ApplicationHelper
    def method_missing method, *args, &block
      # puts "LOOKING FOR ROUTES #{method}"
      if method.to_s.end_with?('_path') or method.to_s.end_with?('_url')
        if storytime.respond_to?(method)
          storytime.send(method, *args)
        elsif main_app.respond_to?(method)
          main_app.send(method, *args)
        else
          super
        end
      else
        super
      end
    end

    def respond_to?(method)
      if method.to_s.end_with?('_path') or method.to_s.end_with?('_url')
        if storytime.respond_to?(method) || main_app.respond_to?(method)
          true
        else
          super
        end
      else
        super
      end
    end
  end
end
