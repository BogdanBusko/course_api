class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid

  has_many :courses
  has_many :categories

  before_create :set_auth_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,                type: String
  field :encrypted_password,   type: String
  field :name,                 type: String
  field :work_place,           type: String
  field :entrepreneur,         type: Mongoid::Boolean, default: false
  field :account_confirmed,    type: Mongoid::Boolean, default: false
  field :facebook,             type: String
  field :phone,                type: String
  field :auth_token,           type: String
  field :role,                 type: Integer, default: 2
  field :last_sign_in,         type: Date
  as_enum :role, user: 'user', admin: 'admin', moderator: 'moderator'

  validates_presence_of   :name, :email
  validates_length_of     :password, minimum: 6, maximum: 16
  validates_uniqueness_of :email
  validates_with EmailAddress::ActiveRecordValidator, field: :email

  before_create :set_user_role

  private

  def set_auth_token
    self.auth_token = SecureRandom.urlsafe_base64
  end

  def set_user_role
    self.role = :user if role.nil?
  end
end
