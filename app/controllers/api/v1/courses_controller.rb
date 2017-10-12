class Api::V1::CoursesController < ApplicationController
  before_action :authenticate_request, :entrepreneur, only: %i[create update]

  def show
    @course = Course.find(params[:id])

    render json: :show, status: :ok
  end

  def create
    course = Course.new(course_params)

    if course.save
      head(:created)
    else
      render json: { error: course.errors.full_messages }, status: :error
    end
  end

  def update
    course = Course.find(params[:id])

    if course.update_attributes(course_params)
      head(:accepted)
    else
      render json: { error: course.errors.full_messages }, status: :error
    end
  end

  private

  def course_params
    params.permit(:name, :price, :duration, :description, :start_date, :status)
  end
end
