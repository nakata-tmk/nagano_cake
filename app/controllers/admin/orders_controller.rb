class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == "confirmation"
      order.order_items.update_all(making_status: "waite_making")
      redirect_to admin_order_path(order), notice: '更新しました'
    else
      @order = order
      redirect_to admin_order_path(order), notice: '更新しました'
    end
  end
  
  private
    def order_params
      params.require(:order).permit(:status)
    end
end
