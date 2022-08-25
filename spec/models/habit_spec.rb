require 'rails_helper'

RSpec.describe Habit, type: :model do
  before do
    @habit = FactoryBot.build(:habit)
  end

  describe '習慣の登録' do
    context '習慣を登録できる場合' do
      it '習慣名と習慣内容を登録できる' do
      end
      it '習慣名のみでも登録できる' do
      end
      it "習慣名がが21文字以下であれば登録できる" do
      end
    end

    context '習慣が登録できない場合' do
      it '習慣名が空では登録できない' do
      end
      it 'ユーザーが紐付いていなければ登録できない' do
      end
      it '習慣名が21文字以上では登録できない' do
      end
    end
  end

end