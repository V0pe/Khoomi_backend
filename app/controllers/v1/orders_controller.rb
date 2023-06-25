class V1::OrdersController < ApplicationController
  def index
    render json: Order.all.to_json
  end

  def show
    order = Order.find_by(id: params[:id])

    if order.nil?
      render status: 404, json: { error: 'order not found' }.to_json
    else
      render json: order.to_json
    end
  end

  def create
    order = Order.new(order_params)

    if order.save
      render json: order.to_json
    else
      render status: 500, json: { error: 'order could not be created' }.to_json
    end
  end

  def destroy
    order = Order.find_by(id: params[:id])

    if order.nil?
      render status: 404, json: { error: 'order not found' }.to_json
    else
      order.destroy
      render json: { message: 'order deleted' }.to_json
    end
  end

  private

  def order_params
    params.require(:order).permit(:item_id, :name, :address, :quantity)
  end
end
