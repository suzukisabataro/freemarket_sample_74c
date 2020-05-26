class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :create, :edit, :update]
  before_action :set_item, except: [:index, :new, :create]
  def index
    @items = Item.limit(10).order('created_at DESC')
  end


  def show
    @item = Item.find(params[:id])
    @item.item_images
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
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to root_path, alert: "ログインしてください"
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to mypage_index_path,(@item),notice: "更新に成功しました"
    else
      render :edit
    end
  end 


  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :area_id, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?     
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
