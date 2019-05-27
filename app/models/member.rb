class Member < ApplicationRecord
  belongs_to :user
  belongs_to :convoy

  validates :convoy, uniqueness: { scope: :user }
end
