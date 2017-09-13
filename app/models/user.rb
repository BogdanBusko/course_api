class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :full_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :work_plays, type: String
  field :employer, type: Mongoid::Boolean
  field :account_confirmation, type: Mongoid::Boolean

  has_secure_password
end
