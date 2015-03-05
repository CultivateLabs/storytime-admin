$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "storytime_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "storytime-admin"
  s.version     = StorytimeAdmin::VERSION
  s.authors     = ["David Van Der Beek"]
  s.email       = ["david@flyoverworks.com"]
  s.homepage    = "http://www.github.com/flyoverworks/storytime-admin"
  s.summary     = "Admin engine originally created for Storytime"
  s.description = "A simple alternative to Active Admin and Rails Admin"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "kaminari"
  s.add_dependency "bootstrap-kaminari-views"
  s.add_dependency "coffee-rails", ">= 4.0"
  s.add_dependency "jquery-rails", ">= 3.0"
  s.add_dependency "haml-rails"
  s.add_dependency "leather"
  s.add_dependency "sass-rails", ">= 4.0"
  s.add_dependency "font-awesome-sass"
  s.add_dependency "simple_form"

  s.add_development_dependency "devise"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "poltergeist", "~>1.5"
  s.add_development_dependency "pry-nav"
  s.add_development_dependency "pry-stack_explorer"
end
