class Admin::BoardsController < ApplicationController
  layout "admin"

  before_filter :require_is_admin

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(params[:board])
    if @board.save
      respond_to do |foramt|
        format.html { redirect_to board_path(@board), :notice => "Board was succesfully created." }
      end
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update_attributes(params[:board])

    respond_to do |format|
      format.html { redirect_to board_path(@board), :notice => "Board was succesffully updated" }
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    redirect_to admin_boards_path
  end
end
