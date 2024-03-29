class BoardsController < ApplicationController
  def index
    @boards = Board.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @board = Board.find(params[:id])
    @posts = @board.posts.paginate(:page => params[:page], :per_page => 5)
  end
end
