class ApplicationController < ActionController::Base
  before_action :set_current_user
  def set_current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    else cookies.signed[:user_id]
      @current_user=User.find_by(id: cookies.signed[:user_id])
    end
  end
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です。"
      redirect_to("/user/login")
    end
  end
  def ensure_login_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません。"
      redirect_to("/home/top")
    end
  end
end
