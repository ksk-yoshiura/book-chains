class Chain < ApplicationRecord
  has_many :books
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
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

  def self.chain_arr_make(chains)
    chain_arr = []
    chains.each do |chain|
      chain_hash = {}
      chain_hash[:id] = chain.id
      chain_hash[:user_id] = chain.user_id
      chain_hash[:nickname] = chain.user.nickname
      chain_hash[:new_chain] = Chain.including_books(chain)
      likes = Like.where(chain_id: chain.id)
      chain_hash[:like] = likes
      chain_arr << chain_hash
    end
    return chain_arr
  end

  def self.judge_and_destroy(book)
    chains = Chain.where(user_id: book.user_id)
     chains.each do |chain|
      if chain.book1_id == book.id || chain.book2_id == book.id || chain.book3_id == book.id || chain.book4_id == book.id
        chain.destroy
      end
    end
  end

  def self.judge_and_search(book_ids)
    books_in_chains = []
    chains = Chain.all.order("created_at DESC")
    
    chains.each do |chain|
      book_ids.each do |book_id|
        if chain.book1_id == book_id || chain.book2_id == book_id || chain.book3_id == book_id || chain.book4_id == book_id
          books_in_chains << chain
        end
      end
    end
    return books_in_chains
  end

end