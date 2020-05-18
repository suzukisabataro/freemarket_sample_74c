class ItemsController < ApplicationController
  def index
    @items = Item.limit(10).order('created_at DESC')
  end


  def show
    @items = Item.find_by(id: params[:id])
    @category = Category.find(@item.category)
    @users = User.all
    # @items=Item.all.includes(:item_images).order('created_at DESC').limit(6)
    # @items = @items.User.build 
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
    params.require(:item).permit(:name, :description, :price, :area_id, :category_id, :condition_id, :delivery_charge_id, :delivery_days_id, item_images_attributes: [:image])
  end
end
