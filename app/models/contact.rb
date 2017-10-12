class Contact
  include Mongoid::Document

  embedded_in :courses, inverse_of: :couses

  field :name, type: String
  field :email, type: String
  field :phone, type: String
  field :facebook, type: String

  validates_uniqueness_of :email, :phone, :facebook
end
