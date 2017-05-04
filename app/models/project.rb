class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date
  validate :start_date_in_future


private

  def start_date_in_future
    errors.add("Start Date", "must be in the future.") unless start_date > Time.now
  end

end
