class NearestCarsService
  def initialize(latitude, longitude, range)
    @latitude = latitude
    @longitude = longitude
    @range = range
  end

  def perform
    return Car.all if latitude_and_longitude_nil?
    @range = ENV['DEFAULT_SEARCH_RANGE'] if @range.nil?
    Car.near([@latitude, @longitude], @range)
  end

  private

  def latitude_and_longitude_nil?
    @latitude.nil? || @longitude.nil?
  end
end