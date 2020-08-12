class TransactionsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if @item.user_id == current_user.id# || item.deal.present?
        redirect_to root_path
      else
        @transaction = Transaction.new
        @address = Address.new
      end
    else
      redirect_to new_user_session_path
    end
  end

  def create
  end

end
