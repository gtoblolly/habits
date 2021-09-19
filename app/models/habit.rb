class Habit < ApplicationRecord
  has_many :records, dependent: :destroy
  with_options presence: true do
    validates :habit
    validates :content
  end
end