$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "browser-timezone-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "browser-timezone-rails"
  s.version     = BrowserTimezoneRails::VERSION
  s.authors     = ["kbaum"]
  s.email       = ["karl.baum@gmail.com"]
  s.homepage    = "https://github.com/kbaum/browser-timezone-rails"
  s.summary     = "Sets the browser timezone within rails"
  s.description = "The browser timezone is set on the Time#zone"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.1"
  s.add_dependency "js_cookie_rails"
  s.add_dependency "jstz-rails3-plus"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "launchy"
  s.add_development_dependency "sqlite3"
end
