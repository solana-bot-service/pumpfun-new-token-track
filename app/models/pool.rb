class Pool < ApplicationRecord
  belongs_to :protocol
  has_and_belongs_to_many :tokens
end
