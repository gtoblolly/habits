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
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # マイページへのボタンがあることを確認する
      expect(page).to have_content("マイページ")
      # マイページに移動する
      visit user_path(@user.id)
      # 習慣生成ページへのボタンがあることを確認する
      expect(page).to have_content("習慣を作る")
      # 習慣生成ページに移動する
      visit new_habit_path
      # フォームに情報を入力する
      fill_in 'habit_title', with: @habit_title
      fill_in 'habit_content', with: @habit_content
      # 送信するとHabitモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Habit.count }.by(1)
      # マイページに遷移することを確認する
      expect(current_path).to eq(user_path(@user.id))
      # マイページには先ほど生成した習慣が存在することを確認する
      expect(page).to have_content (@habit_title)
    end
  end
  context '習慣生成ができないとき'do
    it 'ログインしていないとマイページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # マイページへのボタンがないことを確認する
      expect(page).to have_no_content("マイページ")
    end
  end
end