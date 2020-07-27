class UserController < ApplicationController
  def create
  end
  def create_user
    @user=User.new(name: params[:name],
      mail_address: params[:mail_address])
    if @user.save
      flash[:notice]="登録に成功しました"
      redirect_to("/home/top")
    else
      render("user/create")
    end
  end
  def show
    @user=User.find_by(id: params[:id])
  end
end
