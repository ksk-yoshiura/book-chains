class Chain < ApplicationRecord
  has_many :books
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  validates :user_id, presence: true
  validates :book1_id, presence: true
  validates :book2_id, presence: true
  validates :book3_id, presence: true
  validates :book4_id, presence: true

  def self.including_books(chain)
    book_arr = []
    book1 = Book.find(chain.book1_id)
    book2 = Book.find(chain.book2_id)
    book3 = Book.find(chain.book3_id)
    book4 = Book.find(chain.book4_id)
    
    book_arr << book1
    book_arr << book2
    book_arr << book3
    book_arr << book4
  end
end