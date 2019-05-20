class Convoy < ApplicationRecord
  has_many :members
  belongs_to :user
  belongs_to :to_location, class_name: 'Location', optional: true
  belongs_to :from_location, class_name: 'Location', optional: true
end
