class Book < ApplicationRecord
  belongs_to :user
  has_many :chains

  validates :title, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :user_id, presence: true
  validates :furigana, presence: true, :format => {with: /\p{Hiragana}/, :message =>'はひらがなで入力して下さい。'}
end
