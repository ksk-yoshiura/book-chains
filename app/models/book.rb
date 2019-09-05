class Book < ApplicationRecord
  belongs_to :user
  has_many :chains, through: :chain_books
end
