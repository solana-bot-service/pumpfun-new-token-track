class Token < ApplicationRecord
  has_and_belongs_to_many :pools

  validates :address, presence: true, uniqueness: true
end
