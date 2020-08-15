class TransactionsController < ApplicationController
  before_action :move_to_login, only: [:index, :create]
  before_action :set_item, only: [:index, :create, :move_to_root, :purchase]
  before_action :move_to_root, only: [:index, :create]

  def index    
  end

  def create
    @trade = TradeInfo.new(trade_params)
    if @trade.valid?
      purchase
      @trade.save!
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def trade_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,:item_id).merge(user_id: current_user.id).merge(price: @item.price)
  end

  def move_to_login
    unless user_signed_in?
      flash[:alert] = 'ログインもしくは新規登録をしてください'
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if current_user.id == @item.user_id || @item.deal.present?
      redirect_to root_path
    end
  end

  def purchase
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
