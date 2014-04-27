class CategoryController < ApplicationController
  def show
    category = Category.find params[:id]
    @charities =  category.charity_campaigns
    @categories = Category.all
  end
end
