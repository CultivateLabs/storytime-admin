require "admin/engine"

module Admin
  class << self
    mattr_accessor :nav_title
    self.nav_title = "Admin"

    mattr_accessor :models
    self.models = []
  end

  def self.configure(&block)
    yield self
  end
end
