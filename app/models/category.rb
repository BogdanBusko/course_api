class Category
  include Mongoid::Document

  has_many :courses
  belongs_to :subscriber

  field :category, type: String
end
