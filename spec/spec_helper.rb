require "rspec"
require File.expand_path("../lib/monadic.rb", File.dirname(__FILE__))

if RUBY_VERSION >= "1.9.0"
  require "simplecov"
  SimpleCov.start
end