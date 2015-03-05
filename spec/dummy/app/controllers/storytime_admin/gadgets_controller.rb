module StorytimeAdmin
  class GadgetsController < StorytimeAdmin::ApplicationController
    # Set active navigation link
    set_tab :admin, :gadgets

  private
    ##########################################
    ### Customize permitted_params
    ##########################################
    # def permitted_params
    #   params.require(model_sym).permit(permitted_attributes.map(&:to_sym))
    # end

    ##########################################
    ### Add attributes here to exclude them 
    ### from permitted_params
    ##########################################
    # def permitted_params_blacklist
    #   ["id", "created_at", "updated_at"]
    # end

    ##########################################
    ### Add attributes here to use the default 
    ### form but exclude additional attributes
    ##########################################
    # def form_blacklist
    #   ["id", "created_at", "updated_at"]
    # end

    ##########################################
    ### If you are using the default index 
    ### template, this controls which attribute 
    ### is used in the table
    ##########################################
    # def index_attr
    #   if attributes.include?("title")
    #     "title"
    #   elsif attributes.include?("name")
    #     "name"
    #   else
    #     "id"
    #   end
    # end
  end
end