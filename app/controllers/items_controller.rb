class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_paramas)
      redirect_to item_path
    else
      render :show
    end
  end

  def destroy
    if @item.destroy
    redirect_to root_path
    else
      render :new
    end
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
    params.require(:item).permit(:name, :image, :introduction, :category, :item_condition, :delivery_fee, :shipping_area, :shipping_days, :user, :category_id, :item_condition_id, :shipping_days_id, :shipping_area_id, :delivery_fee_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
