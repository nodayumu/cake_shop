class ItemsController < ApplicationController

  def index
    if params[:search_key].present? # ジャンル検索したかどうか
      @items = Item.where(genre_id: params[:search_key])
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
