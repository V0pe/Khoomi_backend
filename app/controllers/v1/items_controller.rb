class V1::ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.all

    render json: ItemSerializer.new(@item).serializable_hash[:data], status: :ok
  end

  def show
    @item = Item.find_by(id: params[:id])

    if @item.nil?
      render status: 404, json: { error: 'item not found' }.to_json
    else
      render json: ItemSerializer.new(@item).serializable_hash[:data][:attributes], status: :ok
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: ItemSerializer.new(@item).serializable_hash[:data][:attributes], status: :created
    else
      render status: 500, json: { error: 'item could not be created' }.to_json
    end
  end

  def destroy
    item = Item.find_by(id: params[:id])

    if item.nil?
      render status: 404, json: { error: 'item not found' }.to_json
    else
      item.destroy
      render json: { message: 'item deleted' }.to_json
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :color, :price, :brand, :category, :image)
  end
end
