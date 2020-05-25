class ItemsController < ApplicationController
  def index
    @items = Item.limit(10).order('created_at DESC')
  end


  def show
    @item = Item.find(params[:id])
    @item.item_images
    @user = User.find_by(id:@item.user_id)
    @condition = Condition.find(@item.condition_id)
    @charge = DeliveryCharge.find(@item.delivery_charge_id)
    @way = DeliveryWay.find(@item.delivery_way_id)
    @area = Area.find(@item.area_id)
    @day = DeliveryDay.find(@item.delivery_day_id)
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

  def destroy
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :area_id, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id, :delivery_way_id, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
