class PostController < ApplicationController
  def show
    @post=Post.find_by(id: params[:id])
  end
  def create
  end
  def create_action
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/home/top")
  end
end
