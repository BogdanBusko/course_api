class Course
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :contacts, inverse_of: :contacts

  belongs_to :category, optional: true
  belongs_to :user

  field :name,                            type: String
  field :price,                           type: Integer, default: 0
  field :description,                     type: String
  field :start_date,                      type: Date
  field :days_to_start,                   type: Integer
  field :information_is_confirmed,        type: Mongoid::Boolean, default: false
  field :name_of_company_or_entrepreneur, type: String

  validates_length_of :name, minimum: 3, maximum: 100
  validates_length_of :description, maximum: 256
  validates_presence_of :name, :description, :start_date
  validate :validate_start_date

  before_create :counting_days_to_start
  before_update :counting_days_to_start

  accepts_nested_attributes_for :contacts

  scope :courses, -> { where(:information_is_confirmed.ne => false) }

  def self.update_course_days_to_start
    all.map do |course|
      if course.start_date <= DateTime.now
        course.delete
      else
        count_of_days = (course.start_date - DateTime.now).to_i

        course.update_attribute(:days_to_start, count_of_days)
      end
    end
  end

  private

  def counting_days_to_start
    count_of_days = (start_date - DateTime.now).to_i
    self.days_to_start = count_of_days
  end

  def validate_start_date
    errors.add(:start_date, 'should not be lower than the present') if start_date && start_date < DateTime.now
  end
end
