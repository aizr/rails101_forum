class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(params[:board])
    if @board.save
      redirect_to @board
    end
  end

  def show
    @board = Board.find(params[:id])
    @posts = @board.posts
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update_attributes(params[:board])

    redirect_to @board
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    redirect_to boards_path
  end
end
