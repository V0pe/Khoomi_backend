class V1::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Category.all.to_json
  end

  def show
    category = Category.find_by(id: params[:id])

    if category.nil?
      render status: 404, json: { error: 'category not found' }.to_json
    else
      render json: category.to_json
    end
  end

  def create
    category = Category.new(category_params)

    if category.save
      render json: category.to_json
    else
      render status: 500, json: { error: 'category could not be created' }.to_json
    end
  end

  def destroy
    category = Category.find_by(id: params[:id])

    if category.nil?
      render status: 404, json: { error: 'category not found' }.to_json
    else
      category.destroy
      render json: { message: 'category deleted' }.to_json
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
