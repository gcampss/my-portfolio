class CategoriesController < ApplicationController
    
    def index
      @categories = Category.all
    end

    def show
      @categories = Category.find(params[:id])
    end

    def new
    @category = Category.new
    end
    
    def create
        @categories = Category.find(params[:id])
        @categories = Category.new 
    end
end


