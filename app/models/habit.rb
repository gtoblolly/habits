class Habit < ApplicationRecord
  has_many :records, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
end