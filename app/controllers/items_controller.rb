class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_paramas)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def checked
    item = Item.find(params[:id])
    if item.checked 
      item.update(checked: false)
    else
      item.update(checked: true)
    end

    item = Item.find(params[:id])
    render json: { item: item }
  end

  private
  def item_paramas
    params.require(:item).permit(:name, :image, :introduction, :category, :item_condition, :delivery_fee, :shipping_area, :shipping_days, :user,:category_id, :item_condition_id, :shipping_days_id, :shipping_area_id, :delivery_fee_id, :price,).merge(user_id: current_user.id)
  end

end
