require "admin/engine"

module StorytimeAdmin
  class << self
    mattr_accessor :nav_title
    self.nav_title = "Admin"
  end

  def self.configure(&block)
    yield self
  end
end
