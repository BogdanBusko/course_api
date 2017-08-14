class Api::V1::CategoriesController < ApplicationController
  def index
    render json: Category.all, status: :ok
  end

  def show
    category = Category.find(params[:id])

    render json: category.courses, status: :ok
  end
  
  def create
    category = Category.new(cateory_params)
    
    if category.save
      head(:created)
    else
      head(:unprocessable_entity)
    end
  end

  private 

  def cateory_params
    params.permit(:category)
  end 
end
