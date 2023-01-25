class LikesController < ApplicationController

  before_action :authenticate_user!

  def index

  end

  def create
    @like = current_user.likes.new(like_params)
    @like.save!

    #redirect_to @like.post
    redirect_to root_path
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy

    #redirect_to @like.post
    redirect_to root_path
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
