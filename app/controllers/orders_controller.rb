class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :correct_user, only: [:index]

  def index
   @order = Order.all
   @item =Item.find(params[:item_id])
   if @item.purchase
    return redirect_to root_path
   end
  end

   def new
     @order = UserOrder.new(order_params)
   end

  def create
    #@item =Item.find(params[:item_id])
    @order = UserOrder.new(order_params)
  
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  

  private
    def correct_user
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    end

    def set_item
      @item = Item.find(params[:item_id])
    end


  def move_to_index
    unless  user_signed_in?
      redirect_to new_user_session_path
    end
  end
    def order_params
      params.permit( :token, :post_coad, :shipping_area_id, :city, :banchi, :building_num, :phone_num, :item_id, :shipping_area, :city, :banchi, :building_num, :phone_num).merge(user_id: current_user.id)
    end

    def pay_item
      @item = Item.find(params[:item_id])
      
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],  
        currency:'jpy'                
      )
    end
  
end
