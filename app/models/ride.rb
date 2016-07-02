class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  validates :user_id, presence: true
  validates :attraction_id, presence: true

 def take_ride
    if (self.user.tickets < self.attraction.tickets) && (self.user.height < self.attraction.min_height)
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      tickets = self.user.tickets - self.attraction.tickets
      happiness = self.user.happiness + self.attraction.happiness_rating
      nausea = self.user.nausea + self.attraction.nausea_rating

      @user = User.find(self.user.id)
      @user.update(tickets: tickets, happiness: happiness, nausea: nausea)
    end
  end
end