module Admin
  class ApplicationController < Admin.base_controller
    # layout Admin.layout
    append_view_path [Rails.root.join("app", "views", "admin"), Admin::Engine.root.join("app", "views", "admin")]

    before_action :authenticate_user!
    before_action :ensure_admin!
    before_action :load_model, only: [:edit, :update, :destroy]

    helper_method :model, :model_name, :model_sym, :admin_controller?, :headers, :form_attributes, :index_attr

    def index
      @collection = model.all.page(params[:page]).per(20)
    end

    def new
      @model = model.new
    end

    def edit
    end

    def create
      @model = model.new(permitted_params)
      @model.user = current_user if @model.respond_to? :user

      if @model.save
        redirect_to model, notice: "#{model_name} successfully created"
      else
        render :new
      end
    end

    def update
      if @model.update(permitted_params)
        redirect_to model, notice: "#{model_name} successfully updated"
      else
        render :edit
      end
    end

    def destroy
      @model.destroy
      redirect_to model, notice: "#{model_name} successfully deleted"
    end

  private
    def permitted_params
      params.require(model_sym).permit(permitted_attributes.map(&:to_sym))
    end

    def controller_path
      "admin/#{model_name.tableize.to_sym}"
    end

    def ensure_admin!
      unless current_user && current_user.admin?
        redirect_to main_app.root_url, flash: { error: "Only admin users can access this page" }
      end
    end

    def attributes 
      @attributes ||= model.columns.map(&:name)
    end

    def form_attributes
      @form_attributes ||= attributes.reject{ |v| form_blacklist.include?(v) }
    end

    def permitted_attributes
      @permitted_attributes ||= attributes.reject{ |v| permitted_params_blacklist.include?(v) }
    end

    def form_blacklist
      ["id", "created_at", "updated_at"]
    end

    def permitted_params_blacklist
      ["id", "created_at", "updated_at"]
    end

    def index_attr
      if attributes.include?("title")
        "title"
      elsif attributes.include?("name")
        "name"
      else
        "id"
      end
    end

    def load_model
      @model = model.find(params[:id])
    end

    def model
      params[:model_name].classify.constantize
    end

    def model_name
      @model_name ||= params[:model_name].titleize
    end

    def model_sym
      @model_sym ||= model.name.underscore.to_sym
    end

    def admin_controller?
      true
    end

    if Admin.user_class_symbol != :user
      def current_user
        send("current_#{Admin.user_class_underscore_all}".to_sym)
      end
    end
  end
end
