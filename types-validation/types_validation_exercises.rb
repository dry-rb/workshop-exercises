require "bundler/setup"
require "dry-types"
require "dry-struct"
require "dry-validation"
require "pry"

module Types
  include Dry::Types.module

  # TODO: add types here
end

# TODO: build struct classes and validation schemas here

if $0 == __FILE__
  # TODO: play around here ;)

  binding.pry
end

