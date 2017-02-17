class SquirrelsController < ApplicationController
  def index
    @squirrel = Squirrel.first
    @tree = Tree.first
  end

  def show
    @squirrel = Squirrel.find(params[:id])
    @tree = Tree.find(params[:tree_id])
  end

  def new
    @squirrel = Squirrel.new
  end
end
