require 'rails_helper'

RSpec.describe 'the flight index page' do
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
  @flight_passenger_4 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_4)
  @flight_passenger_5 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_5)

  @flight_passenger_6 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_1)
  @flight_passenger_7 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_2)
  @flight_passenger_8 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_3)

  @flight_passenger_9 = FlightPassenger.create!(flight: @flight_3, passenger: @passenger_4)
  @flight_passenger_10 = FlightPassenger.create!(flight: @flight_3, passenger: @passenger_5)
end
