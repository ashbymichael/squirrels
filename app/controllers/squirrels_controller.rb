class SquirrelsController < ApplicationController
  def index
    @squirrels = Squirrel.all
  end

  def show
    @squirrel = Squirrel.find(params[:id])
    @tree = Tree.find(params[:tree_id])
  end

  def new
    @squirrel = Squirrel.new
  end

  private
  def squirrel_params
    params.require(:squirrel).permit(:name, :image)
  end
end
