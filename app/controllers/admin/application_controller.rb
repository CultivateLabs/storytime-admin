module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin!
    before_action :load_model, only: [:edit, :update, :destroy]

    helper_method :model, :model_name, :model_sym, :admin_controller?, :headers

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
    def ensure_admin!
      unless current_user && current_user.admin?
        redirect_to main_app.root_url, flash: { error: "Only admin users can access this page" }
      end
    end

    def load_model
      @model = model.find(params[:id])
    end

    def model
      self.class.name.split("::").last.gsub("Controller", "").singularize.constantize
    end

    def model_name
      @model_name ||= model.name.titleize
    end

    def model_sym
      @model_sym ||= model.name.underscore.to_sym
    end

    def admin_controller?
      true
    end
  end
end
