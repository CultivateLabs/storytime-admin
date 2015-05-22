module StorytimeAdmin
  class WidgetsController < StorytimeAdmin::ApplicationController
    private

      def index_attr
        ["id", "title"]
      end
  end
end