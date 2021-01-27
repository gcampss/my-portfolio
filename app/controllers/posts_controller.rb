class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @category = Category.find(params[:category_id])
    @post.category = @category
    if @post.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)

      redirect_to category_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to category_path(@post.category)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :photos => [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
