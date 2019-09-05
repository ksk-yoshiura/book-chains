class ChainBook < ApplicationRecord
  belongs_to :chain
  belongs_to :book
end