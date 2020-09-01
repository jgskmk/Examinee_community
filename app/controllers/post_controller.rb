class PostController < ApplicationController
  before_action :authenticate_user,only: [:create,:update,:destroy]

  def show
    @post=Post.find_by(id: params[:id])
  end

  def create
  end
  def create_post
    @post = Post.new(content: params[:content])
    @post.user_id=@current_user.id
    @post.user_name=@current_user.name
    if @post.save
      flash[:notice]="投稿しました。"
      redirect_to("/home/top/1")
    else
      render("post/create")
    end
  end
  def update
    @post=Post.find_by(id: params[:id]) #post.idとpost.user_idは異なるためauthenticate_userでは不可
    if @current_user.id != @post.user_id
      flash[:notice]="権限がありません。"
      redirect_to("/home/top/1")
    end
  end
  def update_post
      @post.content=params[:content]
      @post.save
      flash[:notice]="投稿を編集しました。"
      redirect_to("/home/top/1")
  end

  def destroy
    @post=Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      flash[:notice]="権限がありません。"
      redirect_to("/home/top/1")
    else
      @post.destroy
      flash[:notice]="投稿を削除しました。"
      redirect_to("/home/top/1")
    end
  end





end
