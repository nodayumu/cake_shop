class OrdersController < ApplicationController

  def new
    @order = Order.new
    @cart_items = current_end_user.cart_items
    if @cart_items.empty?
      redirect_to cart_items_path, alert: "カートに商品が入っておりません"
    end
  end

  def confirm
    @cart_items = current_end_user.cart_items
    if @cart_items.empty?
      redirect_to cart_items_path, alert: "カートに商品が入っておりません"
    end

    @order = Order.new
    @order.payment_method = params[:order][:payment_method]

    if params[:order][:address_option] == "0"
      @order.address = current_end_user.address
      # Orderモデルのaddressカラム = 現在ログインしているユーザー(EndUserモデル)のaddressカラム
      @order.postal_code = current_end_user.postal_code
      # Orderモデルのpostal_codeカラム = 現在ログインしているユーザー(EndUserモデル)のpostal_codeカラム
      @order.name = current_end_user.last_name + current_end_user.first_name
      # Orderモデルのnameカラム = 現在ログインしているユーザー(EndUserモデル)のlast_nameカラムとfirst_nameカラム
    elsif params[:order][:address_option] == "1"
      # @address = Address.find(params[:order][:address_id])
      @address = Address.find_by(id: params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
			@order.postal_code = params[:order][:postal_code]
			@order.address = params[:order][:address]
			@order.name = params[:order][:name]
    end
  end

  def complete
    @cart_items = current_end_user.cart_items
    if @cart_items.empty?
      redirect_to cart_items_path, alert: "カートに商品が入っておりません"
    end
  end


  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @order.shipping_cost = 800
    @order.billing_amount = 0
    # @order関連は70,71行目に追記(eachメソッドが絡むため)

    @cart_items = current_end_user.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      # order_detailという(中間テーブルOrderDetailモデルの)空の箱を作成し、そこに情報を移す作業、紐付け
      order_detail.item_id = cart_item.item.id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.non_taxed_price * 1.1

      order_detail.order_id = @order.id
      order_detail.save

      @order.billing_amount += (cart_item.item.non_taxed_price * 1.1).round * cart_item.amount
      @order.save
    end

    # @cart_items.destroy_all
    redirect_to complete_orders_path
  end


  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :shipping_cost, :billing_amount, :payment_method, :order_status)
  end

end
