class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: true
  validates :password, presence: true
  validates :happiness, presence: true
  validates :nausea, presence: true
  validates :height, presence: true
  validates :tickets, presence: true

  has_secure_password
  #validates :password, length: { minimum: 6 }, if: :validates_password?
  validates_inclusion_of :admin, :in => [true, false]
  :admin == false

 def mood
    if self.happiness < self.nausea 
      "The rider is sad!"
    else self.happiness > self.nausea
      "The rider is happy!"
  end
end


end
