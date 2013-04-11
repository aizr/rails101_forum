namespace :dev do
  desc "Rebuild system"

  task :fake => :environment do
    require "populator"

    Board.populate(10) do |board|
      board.name = Populator.words(3..5)

      Post.populate(1..20) do |post|
        post.name = Populator.words(3..5)
        post.content = Populator.sentences(7..10)
        post.board_id = board.id
      end
    end
  end

  task :build => [ "tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate" ]
  task :rebuild => [ "dev:build", "db:seed", "dev:fake" ]
end
