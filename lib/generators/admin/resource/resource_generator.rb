module Admin
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def generate_controller
      template 'controller.rb', "app/controllers/admin/#{table_name}_controller.rb"
    end

  private
    def table_name
      @table_name ||= file_path.tableize
    end
  end
end