class HomeController < ApplicationController

  before_action :authenticate_user
  
  def index
    @posts=Post.all.order(created_at: :desc)
  end

  def show
    @post=Post.find_by(id: params[:id])
  end

  def post
    @post=Post.new
  end

  def create
    @post=Post.new(get_post_params)
    if @post.save
      flash[:notice]="書き込みました"
      redirect_to("/home")
    else
      render("/home/post")
    end
  end

  def get_post_params
    params.require(:post).permit(:content)
  end
end
