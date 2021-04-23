require 'rails_helper'

RSpec.describe 'the airline show page' do
  before(:each) do
    @airline_1 = Airline.create!(name: "Frontier")
    @airline_2 = Airline.create!(name: "Delta")

    @flight_1 = @airline_1.flights.create!(number: "7896", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight_2 = @airline_1.flights.create!(number: "9034", date: "08/04/20", departure_city: "Austin", arrival_city: "Portland")
    @flight_3 = @airline_2.flights.create!(number: "8923", date: "08/05/20", departure_city: "Seattle", arrival_city: "Mobile")

    @passenger_1 = Passenger.create!(name: 'Alexander', age: 17)
    @passenger_2 = Passenger.create!(name: 'Joe', age: 18)
    @passenger_3 = Passenger.create!(name: 'Jake', age: 25)
    @passenger_4 = Passenger.create!(name: 'Tom', age: 35)
    @passenger_5 = Passenger.create!(name: 'John', age: 12)

    @flight_passenger_1 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_1)
    @flight_passenger_2 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_2)
    @flight_passenger_3 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_3)
    @flight_passenger_5 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_5)

    @flight_passenger_6 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_1)
    @flight_passenger_7 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_2)
    @flight_passenger_8 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_3)

    @flight_passenger_9 = FlightPassenger.create!(flight: @flight_3, passenger: @passenger_4)
    @flight_passenger_10 = FlightPassenger.create!(flight: @flight_3, passenger: @passenger_5)
  end

  it 'us3 - lists the unique adult passengers on this airline' do
    visit "/airlines/#{@airline_1.id}"
      expect(page).to have_content(@airline_1.name)

      expect(page).to have_content(@passenger_2.name)
      expect(page).to have_content(@passenger_3.name)
      
      expect(page).to_not have_content(@passenger_1.name)
      expect(page).to_not have_content(@passenger_4.name)
      expect(page).to_not have_content(@passenger_5.name)
    end
end




# User Story 3, Airline's Passengers
#
# As a visitor
# When I visit an airline's show page
# Then I see a list of passengers that have flights on that airline
# And I see that this list is unique (no duplicate passengers)
# And I see that this list only includes adult passengers
#
# (Note: an adult is anyone with age greater than or equal to 18)
