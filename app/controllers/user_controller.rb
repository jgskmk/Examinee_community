class UserController < ApplicationController
  def create
  end
  def create_user
    @user=User.new(name: params[:name],
      mail_address: params[:mail_address])
    if @user.save
      flash[:notice]="登録に成功しました。"
      redirect_to("/home/top")
    else
      render("user/create")
    end
  end
  def show
    @user=User.find_by(id: params[:id])
  end
  def login
  end
  def login_action
    @user=User.find_by(name: params[:name], mail_address: params[:mail_address])
    if @user
      flash[:notice]="ログインしました。"
      session[:user_id]=@user.id
      redirect_to("/home/top")
    else
      flash[:notice]="ログインに失敗しました。入力内容を確認してください。"
      render("user/login")
    end
  end
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました。"
    redirect_to("/home/top")
  end
end
