class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :habits, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :likes, dependent: :destroy

  # イイねした記録の取得
  has_many :liked_records, through: :likes, source: :record
  # いいねしたかどうかの判定
  def liked_by?(record_id)
    likes.where(record_id: record_id).exists?
  end

  validates :nickname, presence: true, length: { maximum: 30 }

end
