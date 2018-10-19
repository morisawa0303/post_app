class UserController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end
  

  def create
    @user=User.new(get_user_params)
    if @user.save
      redirect_to("/")
    else
      render("/user/new")
    end
  end

  def get_user_params
    params.require(:user).permit(:name,:mail)
  end

  def login_form
  end

  def login
    @user=User.find_by(mail: params[:mail],password: params[:pass])
    @mail=params[:mail]
    if @user
      flash[:notice]="ログインしました"
      redirect_to("/home")
    else
      
      render("user/login_form")
    end
  end
end

