class Api::V1::CoursesController < ApplicationController
  def index
    @courses = Course.all

    render :index, status: :ok
  end
end
