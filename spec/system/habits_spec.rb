require 'rails_helper'

RSpec.describe "Habits", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @habit_title = Faker::Lorem.sentence
    @habit_content = Faker::Lorem.sentence
  end
  context '習慣を生成できるとき'do
    it 'ログインしたユーザーは習慣を生成できる' do
      # ログインする
      # マイページへのボタンがあることを確認する
      # マイページに移動する
      # 習慣生成ページへのボタンがあることを確認する
      # 習慣生成ページに移動する
      # フォームに情報を入力する
      # 送信するとHabitモデルのカウントが1上がることを確認する
      # マイページに遷移することを確認する
      # マイページには先ほど生成した習慣が存在することを確認する
    end
  end
  context '習慣生成ができないとき'do
    it 'ログインしていないとページに遷移できない' do
      # トップページに遷移する
      # マイページへのボタンがないことを確認する
    end
  end
end