class HomeController < ApplicationController
  def top
    @posts=Post.all
  end
  def about
  end
  def database
    @posts=Post.all
    @users=User.all
  end
end
