class Location < ApplicationRecord

  def convoys
    Convoy.where("to_location_id = #{id} OR from_location_id = #{id}")
  end
end
