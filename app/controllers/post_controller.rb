class PostController < ApplicationController
  before_action :authenticate_user,only: [:create]
  def show
    @post=Post.find_by(id: params[:id])
  end
  def create
  end
  def create_post
    @post = Post.new(content: params[:content])
    @post.user_id=@current_user.id
    @post.user_name=@current_user.name
    @post.save
    flash[:notice]="投稿しました。"
    redirect_to("/home/top")
  end
  def update
    @post=Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id.to_i
      flash[:notice]="権限がありません。"
      redirect_to("/home/top")
    end
  end
  def update_post
      @post.content=params[:content]
      @post.save
      flash[:notice]="投稿を編集しました。"
      redirect_to("/home/top")


  end
end
