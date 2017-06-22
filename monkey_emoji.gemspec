$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "monkey_emoji/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "monkey_emoji"
  s.version     = MonkeyEmoji::VERSION
  s.authors     = ["Phone Z Phyo"]
  s.email       = ["phonezawphyo@gmail.com"]
  s.homepage    = "https://github.com/phonezawphyo/monkey_emoji"
  s.summary     = "Encode and decode unicode emoji characters for saving in db that does not store 4 byte unicode characters."
  s.description = "Unicode characters are encoded into format `{{codepoint_hex}}` before being saved in db. For usage, please refer to the github page."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.required_ruby_version = ">= 1.9.3"
  s.add_dependency "rails", ">= 3.2"

  s.add_development_dependency "sqlite3"
end
