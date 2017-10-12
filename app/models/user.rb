class User
  include Mongoid::Document
  include Mongoid::Timestamps

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
  field :work_place,           type: String, default: 'Інформація не зазначено'
  field :entrepreneur,         type: Mongoid::Boolean, default: false
  field :account_confirmed,    type: Mongoid::Boolean, default: false
  field :facebook,             type: String
  field :phone,                type: String
  field :auth_token,           type: String
  field :role,                 type: Integer, default: 2
  field :last_sign_in,         type: Date

  validates_presence_of   :name, :email
  validates_length_of     :password, minimum: 6, maximum: 16
  validates_uniqueness_of :email
  validates_with EmailAddress::ActiveRecordValidator, field: :email

  private

  def set_auth_token
    self.auth_token = SecureRandom.urlsafe_base64
  end
end
