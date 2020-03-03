class LocationService
  attr_reader :from_location, :to_location, :base_url, :api_key
  attr_accessor :params

  def initialize(params)
    @from_location = params.dig('convoy', 'from_location')
    @to_location = params.dig('convoy', 'to_location')
    @base_url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/'
    @api_key = ENV['MAPBOX_API_KEY']
    @params = params
  end

  def create_location_hash
    return if from_location.empty? || to_location.empty?
    from_id = find_or_create_location(from_location)
    to_id = find_or_create_location(to_location)

    params = update_params_hash(from_id, to_id)
    params
  end

  def find_or_create_location(location)
    db_location = Location.find_by(name: location.capitalize)
    return db_location.id if db_location

    coordinates = get_mapbox_details(location)
    return if coordinates.nil?

    new_location = create_new_location(location, coordinates)
    new_location.id
  end

  def update_params_hash(from, to)
    params['convoy']['from_location_id'] = from
    params['convoy']['to_location_id'] = to
  end

  def get_mapbox_details(location_name)
    response = JSON.parse(HTTParty.get("#{base_url}#{location_name.gsub(/ /, '+')}.json?access_token=#{api_key}"))
    return if response.nil? || response.dig('features').empty?

    features = response.dig('features')&.first
    return if features.empty?

    features.dig('geometry', 'coordinates')
  end

  def create_new_location(name, coordinates)
    Location.create(name: name.capitalize, longitude: coordinates[0], latitude: coordinates[1])
  end
end
