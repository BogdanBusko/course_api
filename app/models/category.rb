class Category
  include ActiveModel::Validations
  include Mongoid::Document

  has_many :courses
  belongs_to :subscriber, optional: true

  field :category, type: String
  field :description, type: String
  field :information_is_confirmed, type: Mongoid::Boolean, default: false

  validates_uniqueness_of :category
  validates_presence_of :category
end
