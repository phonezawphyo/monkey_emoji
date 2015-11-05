$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "monkey_emoji/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "monkey_emoji"
  s.version     = MonkeyEmoji::VERSION
  s.authors     = ["Phone Z Phyo"]
  s.email       = ["phonezawphyo@gmail.com"]
  s.homepage    = ""
  s.summary     = "Encode and decode unicode emoji characters for saving in db that does not store 4 byte unicode characters."
  s.description = "This module injects `encode_emoji` and `decode_emoji` methods to String and NilClass. ActiveRecord::Base is also injected with `encode_emoji` class method so that attributes encodes emoji automatically before save."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "sqlite3"
end
