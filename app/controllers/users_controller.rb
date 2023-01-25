class UsersController < ApplicationController

  before_action :set_user , except: [:notifications,:search]
  before_action :authenticate_user!


   def search
    @users=User.where("email LIKE ?" , "%" + params[:q] + "%")
   end

   def show
     @user = User.find(params[:id])
     @posts=Post.all
   end

   def follow
     current_user.send_follow_request_to(@user)
     #@user.accept_follow_request_of(current_user)
     redirect_to url_for(:controller => :users, :action => :show)
   end

   def unfollow
     current_user.unfollow(@user)
     redirect_to url_for(:controller => :users, :action => :show)
   end

   def accept
     current_user.accept_follow_request_of(@user)
     redirect_to url_for(:controller => :users, :action => :show)
   end


   def decline
     current_user.decline_follow_request_of(@user)
     redirect_to users_path
   end

   def cancel
     current_user.remove_follow_request_for(@user)
     redirect_to url_for(:controller => :users, :action => :show)
   end


   def notifications
   end

   private
   def set_user
   @user = User.find(params[:id])
   end


end
