class HomeController < ApplicationController
  def top
  end

  def show
    @posts=Post.all
  end

  def description
  end
end
