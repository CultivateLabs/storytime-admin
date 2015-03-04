module Admin
  class <%= class_name.pluralize %>Controller < Admin::ApplicationController
    # Set active navigation link
    # set_tab :admin, :topics

  private
    # Define permitted params

    # def permitted_params
    #   params.require(:topic).permit(:name)
    # end

    # Define table headers for index view

    # def headers
    #   ["Name"]
    # end
  end
end