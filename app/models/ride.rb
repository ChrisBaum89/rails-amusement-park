class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @attraction = self.attraction
    #verify if person is tall enough and has enough Tickets
    if (not acceptable_height?) && acceptable_tickets?
      ticket_error_msg
    elsif acceptable_height? && (not acceptable_tickets?)
      height_error_msg
    elsif (not acceptable_height?) && (not acceptable_tickets?)
      ticket_height_error_msg
    else
      update_user_status
      thank_you_msg
    end
  end

  def acceptable_height?
    user.height >= @attraction.min_height
  end

  def acceptable_tickets?
    user.tickets >= @attraction.tickets
  end

  def ticket_error_msg
    "Sorry. You are not tall enough to ride the #{@attraction.name}."
  end

  def height_error_msg
    "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
  end

  def ticket_height_error_msg
    "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
  end

  def thank_you_msg
    "Thanks for riding the #{@attraction.name}!"
  end

  def update_user_status
    user.tickets = user.tickets - @attraction.tickets
    user.happiness = user.happiness + @attraction.happiness_rating
    user.nausea = user.nausea + @attraction.nausea_rating
    user.save
  end

end
