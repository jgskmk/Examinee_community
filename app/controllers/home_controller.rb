class HomeController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc)
    @posts= Post.paginate(page: params[:page], per_page: 1)
  end
  def about
    @posts= Post.paginate(page: params[:page], per_page: 1)
  end
  def database
    @posts=Post.all
    @users=User.all
  end
end
