module Persistence
  class CommentsRepo
    def create(attrs)
      puts "CREATED! #{attrs.inspect}"
    end
  end
end
