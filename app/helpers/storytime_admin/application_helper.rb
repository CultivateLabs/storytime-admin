module StorytimeAdmin
  module ApplicationHelper
    def method_missing method, *args, &block
      # puts "LOOKING FOR ROUTES #{method}"
      if method.to_s.end_with?('_path') or method.to_s.end_with?('_url')
        if main_app.respond_to?(method)
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
        if main_app.respond_to?(method)
          true
        else
          super
        end
      else
        super
      end
    end

    def setup_column_sort(attribute)
      if params[:sort]
        sort_by = if params[:sort].include?('-asc')
          "desc"
        elsif params[:sort].include?('-desc')
          "asc"
        else
          "desc"
        end
      else
        sort_by = "desc"
      end

      type = "#{attribute}-#{sort_by}"

      "#{url_for params.merge(sort: type, page: nil)}"
    end

    def attribute_sort_arrow(attribute)
      if params[:sort] && params[:sort].include?(attribute)
        if params[:sort].include?('-asc')
          sort_parameter = params[:sort].sub('-asc', '')

          icon("caret-up") if sort_parameter == attribute
        elsif params[:sort].include?('-desc')
          sort_parameter = params[:sort].sub('-desc', '')

          icon("caret-down") if sort_parameter == attribute
        end
      end
    end
  end
end
