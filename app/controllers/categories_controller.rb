class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :check_admin?, except: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    # sql
    # select * from posts where post.category_id = @category.id
    # posts = Post.where("post.category_id = ?", @category.id)
    # active record
    # todos os posts desta categoria
    @posts = Post.where(category: @category)
    @photos = []
    @posts.each do |post|
      post.photos.each do |photo|
        photo_post = Post.find(photo.record_id)
        @photos << {
          photo: photo,
          description: photo_post.description,
          title: photo_post.title
        }
      end
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save

    redirect_to category_path(@category)
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category), notice: 'Category updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy!

    redirect_to categories_path
  end

    private

  def category_params
    params.require(:category).permit(:title, :photo)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def check_admin?
    # check if the logged user is an admin or not!
    if current_user && current_user.admin != true
      redirect_to root_path
    end
  end
end
