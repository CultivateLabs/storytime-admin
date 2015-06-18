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

    def sortable(column, title=nil)
      title ||= column.titleize
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
      direction_arrow = if column == sort_column
        direction == "asc" ? icon("caret-up") : icon("caret-down")
      else 
        nil
      end

      link_to "#{title} #{direction_arrow}".html_safe, params.merge(sort: column, direction: direction, page: nil)
    end
  end
end
