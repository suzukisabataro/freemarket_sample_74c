class ItemsController < ApplicationController
  def index
  end

  def show
    @items=Item.all.includes(:item_images).order('created_at DESC')
  end
end
