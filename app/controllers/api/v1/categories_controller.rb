class Api::V1::CategoriesController < BaseController
  before_action :authenticate_request, :entrepreneur, only: [:create]

  def show
    @courses_by_category = Category.find(params[:id]).courses.courses

    render :show, status: :ok
  end

  def create
    category = Category.new(cateory_params)

    if category.save
      head(:created)
    else
      render json: { error: category.errors.full_messages }, status: :error
    end
  end

  private

  def cateory_params
    params.permit(:category)
  end
end
