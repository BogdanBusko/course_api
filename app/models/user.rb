class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :full_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :work_plays, type: String, default: 'Інформація відсутня'
  field :entrepreneur, type: Mongoid::Boolean, default: false
  field :account_confirmation, type: Mongoid::Boolean, default: false
  field :facebook, type: String
  field :phone, type: String

  has_secure_password  

  has_many :courses

  validates_presence_of :full_name, :email
  validates_length_of :password, minimum: 6, maximum: 16 
  validates_uniqueness_of :email
end
