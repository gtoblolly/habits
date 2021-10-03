class Record < ApplicationRecord
  belongs_to :habit
  belongs_to :user
  has_one_attached :image
end
