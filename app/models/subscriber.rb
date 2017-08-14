class Subscriber
  include Mongoid::Document

  has_meny :categories

  field :full_name, type: String
  field :email, type: String
end
