class V1::VendorsController < ApplicationController
  def index
    render json: Vendor.all.to_json
  end

  def show
    vendor = Vendor.find_by(id: params[:id])

    if vendor.nil?
      render status: 404, json: { error: 'vendor not found' }.to_json
    else
      render json: vendor.to_json
    end
  end

  def create
    vendor = Vendor.new(vendor_params)

    if vendor.save
      render json: vendor.to_json
    else
      render status: 500, json: { error: 'vendor could not be created' }.to_json
    end
  end

  def destroy
    vendor = Vendor.find_by(id: params[:id])

    if vendor.nil?
      render status: 404, json: { error: 'vendor not found' }.to_json
    else
      vendor.destroy
      render json: { message: 'vendor deleted' }.to_json
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :address, :country)
  end
end
