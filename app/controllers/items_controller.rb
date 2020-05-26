class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :create, :edit, :update]
  before_action :set_item, except: [:index, :new, :create]
  def index
    @item = Item.limit(10).order('created_at DESC')
    @ladies = Item.where(category: 1).includes(:item_images).order("created_at DESC").limit(10)
    @mens = Item.where(category: 2).includes(:item_images).order("created_at DESC").limit(10)
    @home_appliances = Item.where(category: 8).includes(:item_images).order("created_at DESC").limit(10)
    @others = Item.where(category: 13).includes(:item_images).order("created_at DESC").limit(10)
    @buyer = Item.where(buyer: nil).includes(:item_images)
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
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # @items = Item.find(params[:id])
    # @items.save
  end

  def destroy 
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :area_id, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id, :delivery_way_id, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?     
  end


  def set_item
    @item = Item.find(params[:id])
  end
end
