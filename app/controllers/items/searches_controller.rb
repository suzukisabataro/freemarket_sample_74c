class Items::SearchesController < ApplicationController
  def index
    @items = Item.search(params[:keyword]).order('created_at DESC')
    @parents = Category.where(ancestry: nil).limit(13)
  end
end
