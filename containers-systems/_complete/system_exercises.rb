require "bundler/setup"
require "dry/system/container"
require "pry"

module MyApp
  class Container < Dry::System::Container
    configure do |config|
      config.root = __dir__
      config.auto_register = %w[lib]
    end

    load_paths! "lib"
  end
end

# Comment this out to play with an empty container
MyApp::Container.finalize!

if $0 == __FILE__
  keys = MyApp::Container.keys

  create_comment = MyApp::Container["comments.create"]

  binding.pry
end
