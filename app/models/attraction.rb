class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides

  validates :name, presence: true
  validates :nausea_rating, presence: true
  validates :happiness_rating, presence: true
  validates :ticket_number, presence: true
  validates :min_height, length: { minimum: 32 }

end
