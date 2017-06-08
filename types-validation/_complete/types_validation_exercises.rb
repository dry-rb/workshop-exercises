require "bundler/setup"
require "dry-types"
require "dry-struct"
require "dry-validation"
require "pry"

module Types
  include Dry::Types.module

  ArticleStatus = Types::Strict::String.enum("published", "draft")
end

class Article < Dry::Struct
  attribute :title, Types::Strict::String
  attribute :status, Types::ArticleStatus
  attribute :published_at, Types::Strict::Time.optional
end

ArticleFormSchema = Dry::Validation.Form do
  required(:title).filled
  required(:status).filled(included_in?: Types::ArticleStatus.values)
  required(:published_at).maybe(:time?)

  rule(published_at: [:status, :published_at]) do |status, published_at|
    status.eql?("published") > published_at.filled?
  end
end

if $0 == __FILE__
  input = {
    "title" => "dry-rb workshop",
    "status" => "published",
    "published_at" => "",
  }

  result = ArticleFormSchema.(input)

  article = Article.new(result)

  binding.pry
end
