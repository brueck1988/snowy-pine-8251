class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def passengers_for_show
    self.flights.joins(:passengers)
    .where('passengers.age > ?', 17)
    .select('passengers.name')
    .distinct(:name)
  end

end
