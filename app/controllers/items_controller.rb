class ItemsController < ApplicationController
  before_action :item_sell            # 売却済みかどうかのテスト変数
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_set, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    # 編集対象とユーザーが異なる場合、あるいは売却済みの場合トップページへ遷移
    if (current_user != @item.user) || @itemsell
      redirect_to root_path
    end
  end

  def item_sell
    # 売却済みかどうかのテスト変数 中身を入れると全て売却済みになる
    @itemsell = nil
  end
end
