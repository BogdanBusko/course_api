class Course
  include Mongoid::Document

  embeds_many :contacts
  
  belongs_to :category, optional: true
  # belongs_to :user, optional: true

  field :title, type: String 
  field :price, type: Integer, default: 0
  field :duration, type: String
  field :description, type: String
  field :start_date, type: Date
  field :status, type: String
  field :information_is_confirmed, type: Mongoid::Boolean, default: false

  validates_length_of :title, minimum: 3, maximum: 24
  validates_length_of :description, maximum:256
  validates_presence_of :title, :duration, :description, :start_date
  validate :validate_start_date

  before_create :change_course_status
  before_update :change_course_status
  
  scope :courses, -> { where(:status.ne => 'В обробці!') }

  def self.update_course_days_to_start
    self.where(information_is_confirmed: true).map do |course|
      if course.start_date == DateTime.now
        course.delete
      else
        days_to_start = (course.start_date - DateTime.now).to_i
        
        course.update_attribute(:status, "До початку курсу залишилось: #{ days_to_start } д.")
      end
    end
  end

  private

    def change_course_status
      if information_is_confirmed
          days_to_start = (self.start_date - DateTime.now).to_i
          
          self.status = "До початку курсу залишилось: #{ days_to_start } д."
      else
        self.status = 'В обробці!'
      end 
    end

    def validate_start_date
      if self.start_date
        if self.start_date < DateTime.now
          errors.add(:start_date, 'should not be lower than the present')
        end
      end
    end
end
