class Course
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float
  field :duration, type: Integer
  field :description, type: String
  field :start_date, type: Date
  field :information_is_confirmed, type: Mongoid::Boolean
end
