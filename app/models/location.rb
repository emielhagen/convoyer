class Location < ApplicationRecord
  def convoys
    Convoy.where("to_location_id = #{id} OR from_location_id = #{id}")
  end

  def coordinates
    [longitude, latitude]
  end

  def to_feature
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": coordinates
      }
    }
  end
end
