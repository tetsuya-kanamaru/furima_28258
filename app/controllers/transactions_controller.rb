class TransactionsController < ApplicationController
  before_action :move_to_login, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
