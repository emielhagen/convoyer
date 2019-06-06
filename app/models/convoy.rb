class Convoy < ApplicationRecord
  has_many :members
  has_many :favorite_convoys
  has_many :reviews
  belongs_to :user
  belongs_to :to_location, class_name: 'Location', optional: true
  belongs_to :from_location, class_name: 'Location', optional: true

  validates :name, :from_location_id, :to_location_id, presence: true

  def locations
    [from_location, to_location]
  end

  def features
    locations.map(&:to_feature)
  end

  def is_following?(user)
    FavoriteConvoy.find_by(user_id: user.id, convoy_id: id).present?
  end
end
