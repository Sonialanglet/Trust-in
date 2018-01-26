class CategoriesController < ApplicationController
  def index
    policy_scope(Category)
    @categories = Category.all
  end
end
