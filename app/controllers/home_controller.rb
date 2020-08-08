class HomeController < ApplicationController
  def top
    @posts= Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 1)
  end
  def about
    @posts= Post.paginate(page: params[:page], per_page: 1)
  end
  def database
    @posts=Post.all
    @users=User.all
  end
  def search
    if params[:search_option] == '1'
      @users= User.all.order(created_at: :desc)\
      .where('name LIKE ?', "%#{params[:search]}%")\
      .paginate(page: params[:page], per_page: 1)
    elsif params[:search_option] == '2'
      @posts= Post.all.order(created_at: :desc)\
      .where('content LIKE ?', "%#{params[:search]}%")\
      .paginate(page: params[:page], per_page: 1)
    else
      flash[:notice]="検索フォームを利用してください"
      redirect_to("/home/top/1")
    end
  end
end
