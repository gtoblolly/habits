require 'rails_helper'

RSpec.describe "記録登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @habit = FactoryBot.create(:habit)
		@record_text = Faker::Lorem.sentence
  end
  context '記録できるとき' do
    it 'ログインしたユーザーは記録できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @habit.user.email
      fill_in 'user_password', with: @habit.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 「記録する」ボタンがあることを確認する
			expect(page).to have_content("記録する")
      # 記録作成画面へ遷移する
			visit new_habit_record_path(@habit.id)
      # フォームに情報を入力する
      select @habit.title, from: "record_habit_id"
			fill_in 'record_text', with: @record_text
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('record[image]', image_path, make_visible: true)
      # 「記録を作成する」ボタンを押すとRecordモデルのカウントが1上がることを確認する
			expect{
        find('input[name="commit"]').click
      }.to change { Record.count }.by(1)
      # マイページに遷移することを確認する
			expect(current_path).to eq(user_path(@habit.user_id))
      # マイページに先ほどの記録した習慣のタイトルが存在することを確認する
			expect(page).to have_content(@habit.title)
    end
	end
	context '記録できないとき'do
    it 'ログインしていないとページに遷移できない' do
      # トップページに遷移する
      visit root_path
			# 「記録する」ボタンがあることを確認する
      expect(page).to have_content("記録する")
			# 「記録する」ボタンを押す
      click_on('記録する')
      # ログインページへ戻されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end