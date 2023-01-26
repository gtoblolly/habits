class Record < ApplicationRecord
  belongs_to :habit
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  # イイねしたユーザーの取得
  has_many :liked_users, through: :likes, source: :user

  def self.save(record, habit)
    ActiveRecord::Base.transaction do
      habit.exp_sum += record.exp
      habit.level = habit.exp_sum / 5
      habit.update(exp_sum: habit.exp_sum, level: habit.level)
    end
  end

  def self.destroy(record, habit)
    ActiveRecord::Base.transaction do
      habit.exp_sum -= record.exp
      habit.level = habit.exp_sum / 5
      habit.update(exp_sum: habit.exp_sum, level: habit.level)
    end
  end

end