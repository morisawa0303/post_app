class UserController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user=User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    if User.update(get_user_params)
      flash[:notice]="更新しました"
      redirect_to("/")
    else
      render("/user/edit/#{@user.id}")
    end
  end

  def create
    @user=User.new(get_user_params)
    if @user.save
      flash[:notice]="新規登録しました"
      redirect_to("/")
    else
      render("/user/new")
    end
  end

  def get_user_params
    params.require(:user).permit(:name,:mail,:password)
  end

  def login_form
  end

  def login
    @user=User.find_by(mail: params[:mail],password: params[:pass])
    @mail=params[:mail]
    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/")
    else
      
      render("user/login_form")
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/")
  end
end

