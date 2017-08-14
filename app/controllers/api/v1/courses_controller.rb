class Api::V1::CoursesController < ApplicationController
  def show 
    course = Course.find(params[:id])

    render json: course, status: :ok
  end

  def create
    course = Course.new(course_params)

    if course.save
      head(:created)
    else
      head(:unprocessable_entity)
    end
  end

  def update
    course = Course.find(params[:id])

    if course.update_attributes(course_params)
      head(:accepted)
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    course = Course.find(params[:id])

    if course.destroy 
      head(:accepted)
    else 
      head(:unprocessable_entity)
    end
  end

  private

  def course_params
    params.permit(:title, :price, :duration, :description, :start_date, :status, :link_on_official_site)
  end 
end
