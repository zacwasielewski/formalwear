$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "formalwear/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "formalwear"
  s.version     = Formalwear::VERSION
  s.authors     = ["Zac Wasielewski"]
  s.email       = ["zac@wasielewski.org"]
  s.homepage    = "https://github.com/zacwasielewski/formalwear"
  s.summary     = "Rails FormBuilder extension for generating Bootstrap markup"
  s.description = "Formalwear dresses up your Ruby on Rails forms with Bootstrap-compatible markup."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "sqlite3"
end
