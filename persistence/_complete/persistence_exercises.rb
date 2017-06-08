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

module Entities
  class Article < ROM::Struct
    def teaser
      "Great new article: #{title}"
    end
  end
end

class AuthorsRepo < ROM::Repository[:authors]
  commands :create
end

class ArticlesRepo < ROM::Repository[:articles]
  relations :authors
  commands :create, update: :by_pk
  struct_namespace Entities

  def by_pk(id)
    articles.by_pk(id).one
  end

  def listing
    articles
  end

  private

  def articles
    aggregate(:author).published
  end
end

if $0 == __FILE__
  # Start with a clean database each time
  Persistence.reset_with_migration(MIGRATION)
  Persistence.finalize

  authors_repo = AuthorsRepo.new(Persistence.rom)
  articles_repo = ArticlesRepo.new(Persistence.rom)

  author_1 = authors_repo.create(name: "Jane Doe")
  author_2 = authors_repo.create(name: "John Doe")

  published_1 = articles_repo.create(title: "My first article", published: true, author_id: author_1.id)
  published_2 = articles_repo.create(title: "My second article", published: true, author_id: author_2.id)
  draft_1     = articles_repo.create(title: "Some draft", published: false, author_id: author_2.id)
  draft_1     = articles_repo.update(draft_1.id, title: "Another article")

  articles_list = articles_repo.listing.to_a

  binding.pry
end
