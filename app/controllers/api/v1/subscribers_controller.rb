class Api::V1::SubscribersController < ApplicationController
  def create 
    subsciber = Subsriber.new(subscriber_params)

    if subsciber.save 
      head(:accepted)
    else 
      head(:unprocessable_entity)
    end
  end

  private 

  def subscriber_params
    params.permit(:full_name, :email)
  end 
end
