class Like < ApplicationRecord
  belongs_to :user
  belongs_to :chain
  validates_uniqueness_of :chain_id, scope: :user_id
end