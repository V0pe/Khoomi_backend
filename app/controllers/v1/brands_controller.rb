class V1::BrandsController < ApplicationController
  def index
    render json: Brand.all.to_json
  end

  def show
    brand = Brand.find_by(id: params[:id])

    if brand.nil?
      render status: 404, json: { error: 'Brand not found' }.to_json
    else
      render json: brand.to_json
    end
  end

  def create
    brand = Brand.new(brand_params)

    if brand.save
      render json: brand.to_json
    else
      render status: 500, json: { error: 'Brand could not be created' }.to_json
    end
  end

  def destroy
    brand = Brand.find_by(id: params[:id])

    if brand.nil?
      render status: 404, json: { error: 'brand not found' }.to_json
    else
      brand.destroy
      render json: { message: 'brand deleted' }.to_json
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
