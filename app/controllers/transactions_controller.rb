class TransactionsController < ApplicationController
  before_action :move_to_login, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def move_to_login
    @item = Item.find(params[:item_id])
    if user_signed_in? && @item.user_id == current_user.id
        redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

end
