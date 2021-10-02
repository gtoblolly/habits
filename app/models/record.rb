class Record < ApplicationRecord
  belongs_to :habit
  has_one_attached :image
end
