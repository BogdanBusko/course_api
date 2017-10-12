class Api::V1::MainController < ApplicationController
  def index
    @categories = Category.all
    @courses = Course.courses

    render :index, status: :ok
  end
end
