class Habit < ApplicationRecord
  has_many :records, dependent: :destroy
  with_options presence: true do
    validates :title
    validates :content
  end
end