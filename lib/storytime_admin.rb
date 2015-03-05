require "storytime_admin/engine"

module StorytimeAdmin
  class << self
    mattr_accessor :nav_title, :models, :user_class, :layout, :base_controller
    self.nav_title = "Admin"
    self.base_controller = "::ApplicationController"
    @@user_class = "User"
  end

  def self.configure(&block)
    yield self
  end

  def self.models
    Dir.glob(Rails.root.join("app", "controllers", "storytime_admin", "**/*")).map{|controller| controller.split("/").last.split("_controller")[0]}
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
