module Admin
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def generate_controller
      template 'controller.rb', "app/controllers/admin/#{table_name}_controller.rb"
    end

    def create_views_directory
      empty_directory "app/views/admin/#{table_name}"
    end

    def generate_row
      template 'fields.rb', "app/views/admin/#{table_name}/_fields.html.haml"
    end

    def generate_fields
      template 'row.rb', "app/views/admin/#{table_name}/_row.html.haml"
    end

    def add_route
      replace_in_file 'config/routes.rb',
        /Admin::Engine\.routes\.draw do\n/, 
        "Admin::Engine\.routes\.draw do\n  resources :#{table_name}, except: :show\n"
    end

    def add_nav_link
      append_to_file 'app/views/admin/application/_links.html.haml',
        "\n= nav_item icon('comment-o', '#{table_name.titleize}'), #{class_name}, nav_id: [:admin, :#{table_name}]"
    end

  private
    def table_name
      @table_name ||= file_path.tableize
    end

    def replace_in_file(relative_path, find, replace)
      path = File.join(destination_root, relative_path)
      contents = IO.read(path)
      unless contents.gsub!(find, replace)
        raise "#{find.inspect} not found in #{relative_path}"
      end
      File.open(path, "w") { |file| file.write(contents) }
    end
  end
end