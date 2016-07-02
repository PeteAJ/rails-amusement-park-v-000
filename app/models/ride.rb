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


   #def take_ride
    #enough_tickets, tall_enough = meet_requirements
    #if enough_tickets && tall_enough
     # start_ride
    #elsif tall_enough && !enough_tickets
     # "Sorry. " + ticket_issue
    #elsif enough_tickets && !tall_enough
     # "Sorry. " + height_issue
    #else
     # "Sorry. " + ticket_issue + " " + height_issue
    #end
  #end




    def meet_requirements
    enough_tickets, tall_enough = false
    if self.user.tickets >= self.attraction.tickets
      enough_tickets = true
    end
    if self.user.height >= self.attraction.min_height
      tall_enough = true 
    end
    return [enough_tickets, tall_enough]
  end

  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
    "Thanks for riding the #{self.attraction.name}!"
  end

  def ticket_issue
    "You do not have enough tickets the #{self.attraction.name}."
  end

  def height_issue
    "You are not tall enough to ride the #{self.attraction.name}."
  end

end