class Course
  include Mongoid::Document
  
  embeds_many :contacts
  
  field :title, type: String
  field :price, type: Integer
  field :duration, type: Integer
  field :description, type: String
  field :start_date, type: Date
  field :status, type: String
  field :link_on_official_site, type: String
  field :information_is_confirmed, type: Mongoid::Boolean

  before_create :change_course_status
  before_update :change_course_status
  
  private

  def change_course_status
    if information_is_confirmed
      days_to_start = (self.start_date - DateTime.now).to_i

      if self.start_date <= DateTime.now
         self.status = 'Почався'
      else 
        self.status = "До початку курсу залишилось: #{ days_to_start } днів"
      end
    else
      self.status = 'В обробці!'
    end 
  end
end
