class PostsController < ApplicationController
before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(set_post)
    @post.save
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to category_path
    else
      render :edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!

    redirect_to categories_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :photos)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
