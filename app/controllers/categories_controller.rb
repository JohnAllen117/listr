class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @lists = @category.lists
  end
end
