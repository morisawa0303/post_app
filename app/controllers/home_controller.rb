class HomeController < ApplicationController
  def show
    @posts=Post.all
  end

  def post
    @post=Post.new
  end

  def create
    @post=Post.new(get_post_params)
    if @post.save
      redirect_to("/home/show")
    else
      render("/home/post")
    end
  end

  def get_post_params
    params.require(:post).permit(:content)
  end
end
