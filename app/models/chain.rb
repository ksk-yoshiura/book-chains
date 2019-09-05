class Chain < ApplicationRecord
  has_many :books, through: :chain_books
  belongs_to :user
  # accepts_nested_attributes_for :chain_books
  
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
