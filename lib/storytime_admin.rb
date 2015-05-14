require "storytime_admin/engine"

module StorytimeAdmin
  class << self
    mattr_accessor :nav_title, :models, :user_class, :layout, :base_controller, :ensure_admin_method, :ensure_admin_scope
    self.nav_title = "Admin"
    self.base_controller = "::ApplicationController"
    @@user_class = "User"
    self.ensure_admin_method = "admin?"
    self.ensure_admin_scope = nil
  end

  def self.configure(&block)
    yield self
  end

  def self.models
    @@models ||= begin
      files = Dir.glob(Rails.root.join("app", "controllers", "storytime_admin", "**/*"))
      files.select{|val| val.ends_with?("_controller.rb") }
           .map{|controller| controller.split("storytime_admin").last.gsub("_controller.rb", "").sub("/", "").classify }
   end
  end

  def self.user_class
    @@user_class.constantize
  end

  def self.user_class_underscore
    @@user_class.underscore
  end

  def self.user_class_underscore_all
    @@user_class.underscore.gsub('/', '_')
  end

  def self.user_class_symbol
    @@user_class.underscore.to_sym
  end
end
