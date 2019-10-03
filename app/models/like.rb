class Like < ApplicationRecord
  belongs_to :user
  belongs_to :chain
  validates_uniqueness_of :chain_id, scope: :user_id
  

  def self.like_counter(chains)
    like_num = 0
    chains.each do |chain|
      
      like_count = Like.where(chain_id: chain.id).count
      if like_count > like_num
        like_num = like_count
        @most_favorite_chain_id = chain.id
      end
    end
    return @most_favorite_chain_id
  end
end