class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAdress.new
  end

  def create
    @order_address = OrderAdress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end
end
