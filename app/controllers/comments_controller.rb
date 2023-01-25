class CommentsController < ApplicationController

before_action :get_post


def index
render
end

def new
@comment=@post.comments.build
end

def create
  @comment=@post.comments.build(comment_params)
  if (@comment.save)
    redirect_to post_path(@post)
  else
    render 'posts/show'
  end
end

def destroy
  @comment=@post.comments.find(params[:id])
  @comment.destroy
  redirect_to post_path(@post)
end



private
def get_post
  @post=Post.find(params[:post_id])
end

def comment_params
  params.require(:comment).permit(:post_id,:user_id,:body)
end


end
