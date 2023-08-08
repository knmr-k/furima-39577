class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set
  before_action :contributor_confirmation

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    # OrderFormクラスはApplicationRecordを継承していないのでバリデーションが必要
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def item_set
    # paramsの中身はitem_id
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    # 購入対象とユーザーが同じ場合、あるいは売却済みの場合トップページへ遷移
    if (current_user == @item.user) || !@item.order.nil?
      redirect_to root_path
    end
  end
end
