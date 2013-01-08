$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "browser_tzone/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "browser_tzone"
  s.version     = BrowserTzone::VERSION
  s.authors     = ["kbaum"]
  s.email       = ["karl.baum@gmail.com"]
  s.homepage    = "https://github.com/kbaum/browser_tzone"
  s.summary     = "Sets the browser timezone within rails"
  s.description = "The browser timezone is set on the Time#zone"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
