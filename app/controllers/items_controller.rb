class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
    # 売却済みかどうかのテスト変数 中身を入れると全て売却済みになる
    @itemsell = nil
  end
  
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    # 売却済みかどうかのテスト変数 中身を入れると全て売却済みになる
    @itemsell = nil
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end
end
