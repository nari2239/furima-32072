class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :period_id, :price).merge(user_id: current_user.id)
  end
end
