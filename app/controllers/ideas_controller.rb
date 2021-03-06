class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    # TODO: send flash with redirect - wierdness
    @idea = Idea.new(idea_params)

    if @idea.save
      flash[:notice] = "Idea synchronized"
      redirect_to ideas_path
    else
      render :new
    end
  end

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
