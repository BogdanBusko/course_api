class Contact
  include Mongoid::Document
  
  embedded_in :courses
  
  field :name, type: String
  field :email, type: String
  field :phone, type: String
  field :facebook, type: String
end
