class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :chains, dependent: :destroy
  has_many :likes, dependent: :destroy
  

  def already_liked?(chain)
    self.likes.exists?(chain_id: chain[:id])
  end
end