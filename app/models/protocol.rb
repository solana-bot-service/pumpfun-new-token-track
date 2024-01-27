class Protocol < ApplicationRecord
  has_many :pools
  has_many :tokens, through: :pools
end
