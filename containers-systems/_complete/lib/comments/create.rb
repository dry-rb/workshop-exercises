require "my_app/import"

module Comments
  class Create
    include MyApp::Import["persistence.comments_repo"]
  end
end
