class HomeController < ApplicationController

  before_action :authenticate_user
  
  def index
    @post = Post.ransack(params[:q])
    @posts = @post.result.order(created_at: :desc)
  end

  def show
    @post=Post.find_by(id: params[:id])
    @user=User.find_by(id: @post.user_id)
  end

  def post
    @post=Post.new
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="削除しました"
    redirect_to("/home")
  end
  
  def create
    @post = Post.new(
      content: get_post_params[:content],
      image_path: get_post_params[:image_path],
      user_id: @now_user.id
    )
    if @post.save
      flash[:notice]="書き込みました"
      redirect_to("/home")
    else
      render("/home/post")
     end
  end

 def get_post_params
  params.require(:post).permit(:content,:image_path)
 end
end
