require "rom"
require "rom/sql"

module Persistence
  def self.config
    @config ||= ROM::Configuration.new(:sql, "sqlite::memory").tap do |config|
      config.plugin :sql, relations: :auto_restrictions
    end
  end

  def self.db
    @db ||= config.gateways[:default]
  end

  def self.rom
    raise "not finalized" unless instance_variable_defined?(:@rom)
    @rom
  end

  def self.finalize!
    @rom ||= begin
      config.auto_registration File.join(__dir__, "lib/persistence")
      ROM.container(config)
    end
  end
end
