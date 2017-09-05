class Api::V1::MainController < ApplicationController
  def index
    @categories = Category.all
    @courses = if params[:search].present?
        Course.where(title: /#{params[:search].gsub("%20", " ").gsub("%23", "#")}/i)
      else
        Course.courses
      end

    render :index, status: :ok
  end 
end
