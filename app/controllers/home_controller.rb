class HomeController < ApplicationController
  def show
    @posts=Post.all
  end

  def post
  end

  def create
    @post=Post.new(content:params[:content])
    if @post.save
      @post.save
      redirect_to("/home/show")
    else
      render("/home/post")
    end
  end
end
