class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil).limit(13)
  end
end
