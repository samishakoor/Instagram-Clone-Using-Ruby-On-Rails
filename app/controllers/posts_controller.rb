class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  layout :resolve_layout


def index
  if user_signed_in?
    @posts=Post.all
    render layout: "sign_in_layout"
  end
end


def myposts
  @posts=Post.all
end


def show
  @post=Post.find(params[:id])
end

def new
  @post=Post.new
end

def create
  @post=Post.create(post_params)
  if (@post.save)
    redirect_to @post
  else
    render 'new'
  end
end

def edit
  @post=Post.find(params[:id])
end

def update
  @post=Post.find(params[:id])

  if (@post.update(post_params))
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post=Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
end

private
def post_params
  params.require(:post).permit(:title,:body, :user_id,images: [])
end

def resolve_layout
  case action_name
  when "show"
    "posts_show"
  when "myposts"
    "myposts_layout"
  end

end

end
