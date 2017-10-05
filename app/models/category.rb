class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :courses
  belongs_to :user, optional: true

  field :name, type: String
  field :information_is_confirmed, type: Mongoid::Boolean

  validates_uniqueness_of :name
  validates_presence_of :name
end
