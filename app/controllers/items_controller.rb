class ItemsController < ApplicationController
  def index
    @items = Item.limit(10).order('created_at DESC')
    # @items=Item.all.includes(:user, :item_image)
  end


  def show
    @items=Item.find(params[:id]).includes(:item_images).order('created_at DESC')
    @url = request.url
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def edit
    # @items = Item.find(params[:id])
    # @items.save
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :area_id, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id, item_images_attributes: [:image])
  end
end
