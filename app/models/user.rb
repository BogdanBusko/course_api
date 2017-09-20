class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,                type: String
  field :encrypted_password,   type: String
  field :full_name,            type: String
  field :work_plays,           type: String, default: 'Інформація відсутня'
  field :entrepreneur,         type: Mongoid::Boolean, default: false
  field :account_confirmation, type: Mongoid::Boolean, default: false
  field :facebook,             type: String
  field :phone,                type: String
  field :auth_token,           type: String
  
  has_many :courses

  validates_presence_of   :full_name, :email
  validates_length_of     :password, minimum: 6, maximum: 16 
  validates_uniqueness_of :email
end
