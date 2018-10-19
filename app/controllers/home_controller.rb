class HomeController < ApplicationController
  def show
    @posts=Post.all
  end

  def post
  end

  def create
    @post=Post.new(content:params[:content])
    @post.save
    redirect_to("/home/show")
  end
end
