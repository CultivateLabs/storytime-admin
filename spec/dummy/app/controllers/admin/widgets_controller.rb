module Admin
  class WidgetsController < Admin::ApplicationController
    set_tab :admin, :widgets

  private
    # def permitted_params
    #   params.require(:widget).permit(:title)
    # end
  end
end