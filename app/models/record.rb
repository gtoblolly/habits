class Record < ApplicationRecord
  belongs_to :habit
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  # イイねしたユーザーの取得
  has_many :liked_users, through: :likes, source: :user
end
