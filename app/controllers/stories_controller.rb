class StoriesController < ApplicationController

  before_action :authenticate_user!
  layout :resolve_layout

  def index
  @stories=Story.all
  end

  def new
    @story=Story.new
  end

  def create
    @story=Story.create(story_params)
    if (@story.save)
      redirect_to url_for(:controller => :stories, :action => :index)
    else
      render 'new'
    end
  end

  def destroy
    @story=Story.find(params[:id])
    @story.destroy
    redirect_to url_for(:controller => :stories, :action => :index)
  end


  def edit
    @story=Story.find(params[:id])
  end

  def update
    @story=Story.find(params[:id])

    if (@story.update(story_params))
      redirect_to @story
    else
      render 'edit'
    end
  end

  def show
    @story=Story.find(params[:id])
  end

private
def story_params
  params.require(:story).permit(:body, :user_id, :image)
end

def resolve_layout
  case action_name

  when "index"
    "stories_index_layout"
  end

end



end
