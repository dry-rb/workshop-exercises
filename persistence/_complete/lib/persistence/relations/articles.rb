module Persistence
  module Relations
    class Articles < ROM::Relation[:sql]
      schema :articles, infer: true do
        associations do
          belongs_to :author
        end
      end

      def published
        where(published: true)
      end

      def drafts
        where(published: false)
      end
    end
  end
end
