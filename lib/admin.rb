require "admin/engine"

module Admin
  class << self
    mattr_accessor :nav_title, :models, :user_class, :layout, :controller
    @@nav_title = "Admin"
    @@models = []
    @@user_class = "User"
    @@layout = "application"
    @@controller = '::ApplicationController'
  end

  def self.configure(&block)
    yield self
  end

  def self.base_controller
    @@controller.constantize
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
