DB = []

class ArticlesRepo
  def create(attrs)
    DB << attrs
    attrs
  end
end

class FetchFeed
  def call(url)
    # fetch the feed
    [
      {title: "Some article"},
      {title: "Another article"},
    ]
  end
end

class ImportArticles
  attr_reader :fetch_feed, :repo

  def initialize(fetch_feed:, repo:)
    @fetch_feed = fetch_feed
    @repo = repo
  end

  def call(url)
    articles = fetch_feed.(url)

    articles.each do |article|
      repo.create(article)
    end
  end
end

repo = ArticlesRepo.new
fetch_feed = FetchFeed.new

import_articles = ImportArticles.new(
  repo: repo,
  fetch_feed: fetch_feed,
)

p DB

import_articles.("https://daringfireball.net/feeds/json")

p DB
