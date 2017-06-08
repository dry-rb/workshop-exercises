require "bundler/setup"
require "pry"
require "rom-repository"

require_relative "setup"

MIGRATION = Persistence.db.migration do
  change do
    create_table :authors do
      primary_key :id
      column :name, :text, null: false
    end

    create_table :articles do
      primary_key :id
      column :title, :text, null: false
      column :published, :boolean, null: false, default: false
      foreign_key :author_id, :authors
    end
  end
end

# TODO: add exercise code here

if $0 == __FILE__
  # Start with a clean database each time
  Persistence.reset_with_migration(MIGRATION)
  Persistence.finalize

  # TODO: play around here ;)

  binding.pry
end
