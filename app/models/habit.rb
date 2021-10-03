class Habit < ApplicationRecord
  has_many :records, dependent: :destroy
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :content
  end
end