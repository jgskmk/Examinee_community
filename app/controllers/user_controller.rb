class UserController < ApplicationController
  before_action :ensure_login_user,only: [:update]
  before_action :authenticate_user,only: [:delete]
  protect_from_forgery :except => [:logout]
  include UserHelper
  def create
  end
  def create_user
    @user=User.new(name: params[:name],
      mail_address: params[:mail_address],
    password: params[:password])
    if params[:image]
      @user.image_name = "#{@user.mail_address}.jcg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    else
      @user.image_name = "default.jpg"
    end
    if @user.save
      flash[:notice]="登録に成功しました。"
      redirect_to("/user/login")
    else
      render("user/create")
    end
  end
  def show
    @user=User.find_by(id: params[:id])
  end
  def login
  end
  def login_user
    @user=User.find_by(name: params[:name],
      mail_address: params[:mail_address],)
    if @user && @user.authenticate(params[:password])
      flash[:notice]="ログインしました。"
      session[:user_id]=@user.id
      params[:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to("/home/top/1")
    else
      flash[:notice]="ログインに失敗しました。入力内容を確認してください。"
      render("user/login")
    end
  end

  def logout
    @user=User.find_by(id: @current_user.id)
    @user.remember_digest=nil
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session[:user_id]=nil
    flash[:notice]="ログアウトしました。"
    redirect_to("/home/top/1")
  end

  def update
    @user= User.find_by(id: params[:id])
  end
  def update_user
      @user =User.find_by(id: params[:id])
      @user.name= params[:name]
      @user.mail_address= params[:mail_address]
    if params[:image]
      @user.image_name = "#{@user.mail_address}.jcg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice]="ユーザー情報を編集しました。"
      redirect_to("/home/top/1")
    else
      render("user/update")
    end
  end

  def destroy
      @user=User.find_by(id: @current_user.id)
      @user.remember_digest=nil
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
      session[:user_id]=nil
      @user.destroy
      flash[:notice]="アカウントを削除しました。"
      redirect_to("/home/top/1")
    end





end
