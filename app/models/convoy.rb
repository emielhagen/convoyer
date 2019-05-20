class Convoy < ApplicationRecord
  has_many :members
  belongs_to :user
end
