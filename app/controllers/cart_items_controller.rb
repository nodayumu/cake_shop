class CartItemsController < ApplicationController

  def index
    # @cart_items = CartItem.all
    @cart_items = current_end_user.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_end_user.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
  end

end
