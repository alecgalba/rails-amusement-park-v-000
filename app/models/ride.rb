class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.attraction.min_height > self.user.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.attraction.min_height > self.user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.user.tickets = (self.user.tickets - self.attraction.tickets)
      self.user.nausea = (self.user.nausea + self.attraction.nausea_rating)
      self.user.happiness = (self.user.happiness + self.attraction.happiness_rating)
      user.save
    end
  end
end
