require "rom"
require "rom/sql"

module Persistence
  def self.config
    @config ||= ROM::Configuration.new(:sql, "postgres://localhost/persistence_exercises").tap do |config|
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

  def self.finalize
    @rom ||= begin
      config.auto_registration File.join(__dir__, "lib/persistence")
      ROM.container(config)
    end
  end

  def self.reset_with_migration(migration)
    db.connection.tables.each do |table|
      db.connection.drop_table table, cascade: true
    end

    migration.apply db.connection, :up
  end
end
