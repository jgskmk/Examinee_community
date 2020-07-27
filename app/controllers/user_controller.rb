class UserController < ApplicationController
  def create
  end
  def create_user
    user=User.new(name: params[:name],
      mail_address: params[:mail_address])
    if user.save
      redirect_to("/home/top")
    else
      redirect_to("/user/create")
    end
  end
  def show
    @user=User.find_by(id: params[:id])
  end
end
