class UserController < ApplicationController
  before_action :authenticate_user,{only:[:index,:show,:edit]}
  before_action :forbid_login_user,{only:[:new,:login_form]}

  def index
    @user = User.ransack(params[:q])
    @users = @user.result.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    # @posts = @user.mypost.order(created_at: :desc)
    @posts = @user.posts
  end

  def new
    @user=User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user!=@now_user
      flash[:notice]="不正なアクセスです"
      redirect_to("/") 
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(get_user_params)
      flash[:notice]="更新しました"
      redirect_to("/")
    else
      #render("/user/#{@user.id}/edit")
      redirect_back(fallback_location: "/")
    end
  end

  def create
    @user=User.new(get_user_params)
    if @user.save
      flash[:notice]="新規登録しました"
      redirect_to("/")
    else
      redirect_to("/user/signup")
    end
  end

  def get_user_params
    params.require(:user).permit(:name,:mail,:password)
  end

  def login_form
    @user
  end

  def login
    @user=User.find_by(mail: params[:mail])
    #@mail=params[:mail]
    if @user && @user.authenticate(params[:pass])
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

