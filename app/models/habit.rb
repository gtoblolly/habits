class Habit < ApplicationRecord
  with_options presence: true do
    validates :habit
    validates :content
  end
end