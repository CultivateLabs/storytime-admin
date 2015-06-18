module StorytimeAdmin
  class WidgetsController < StorytimeAdmin::ApplicationController
    private

      def index_attr
        {
          "id" => "id",
          "title" => "title"
        }
      end
  end
end