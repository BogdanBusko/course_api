class Api::V1::MainController < ApplicationController
  def index
    render json: { 
      categories: Category.all,
      courses: Course.all
    }
  end 
end
