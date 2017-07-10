class Api::V1::CoursesController < ApplicationController
  def index
    render json: Course.all, status: :ok
  end
end
