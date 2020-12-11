class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
    
    def index
      @categories = Category.all
  
    end

    def show
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
     if @category = Category.update(category_params)
      redirect_to category_path(@category), notice: 'Category updated successfully'
     else
      render :new
     end
    end
    

    def destroy
      @category = Category.find(params[:id])
      @category.destroy!

      redirect_to categories_path
    end

    private

    def category_params
    params.require(:category).permit(:title,:photo)
    end

    def set_category
      @category = Category.find(params[:id])
    end
  end

