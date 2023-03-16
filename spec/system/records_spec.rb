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
      # 「記録を作成する」ボタンを押すとRecordモデルのカウントが1上がり、Habitモデルのhabit.exp_sumの値が１上がることを確認する
			expect{
        find('input[name="commit"]').click
        binding.pry
      }.to change { Record.count }.by(1)
      # マイページに遷移することを確認する
			expect(current_path).to eq(user_path(@habit.user_id))
      # マイページに先ほどの記録した習慣のタイトルが存在することを確認する
			expect(page).to have_content(@habit.title + "習慣達成")
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

RSpec.describe '記録編集', type: :system do
  before do
    @record1 = FactoryBot.create(:record)
    @record2 = FactoryBot.create(:record)
  end
  context '記録の編集ができるとき' do
    it 'ログインしたユーザーは自分が生成したした記録の編集ができる' do
      # 記録1を生成したユーザーでログインする
      visit new_user_session_path
      fill_in 'user_email', with: @record1.user.email
      fill_in 'user_password', with: @record1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 記録1の詳細ページに遷移する
      visit habit_record_path(@record1.habit_id, @record1.id)
      # [記録を編集]へのリンクがあることを確認する
      expect(page).to have_link '記録を編集', href: edit_habit_record_path(@record1.habit_id, @record1.id)
      # 記録編集ページへ遷移する
      visit edit_habit_record_path(@record1.habit_id, @record1.id)
      # すでに生成済みの内容がフォームに入っていることを確認する
      expect(
        find('#record_text').value
      ).to eq @record1.text
      # 記録内容を編集する
      fill_in 'record_text', with: "#{@record1.text}+編集した記録名"
      image_path = Rails.root.join('public/images/test_image.png')
      # 編集してもRecordモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Record.count }.by(0)
      # 記録詳細ページに遷移したことを確認する
      expect(current_path).to eq(habit_record_path(@record1.habit_id, @record1.id))
      # 記録詳細ページには先ほど変更した内容の記録が存在することを確認する（記録内容）
      expect(page).to have_content("#{@record1.text}+編集した記録")
    end
  end
  context '記録の編集ができないとき' do
    it 'ログインしたユーザーは自分以外が生成した記録の編集画面には遷移できない' do
      # 記録1を生成したユーザーでログインする
      visit new_user_session_path
      fill_in 'user_email', with: @record1.user.email
      fill_in 'user_password', with: @record1.user.password
      find('input[name="commit"]').click
      # 記録2の記録詳細ページへ遷移する
      visit habit_record_path(@record2.habit_id, @record2.id)
      # 「記録を編集」へのリンクがないことを確認する
      expect(page).to have_no_link '記録を編集', href: edit_habit_record_path(@record1.habit_id, @record1.id)
    end
    it 'ログインしていないと記録の編集画面には遷移できない' do
      # 記録1の記録詳細ページへ遷移する
      visit habit_record_path(@record1.habit_id, @record1.id)
      # 「記録を編集」へのリンクがないことを確認する
      expect(page).to have_no_link '記録を編集', href: edit_habit_record_path(@record1.habit_id, @record1.id)
      # 記録2の記録詳細ページへ遷移する
      visit habit_record_path(@record2.habit_id, @record2.id)
      # 「記録を編集」へのリンクがないことを確認する
      expect(page).to have_no_link '記録を編集', href: edit_habit_record_path(@record2.habit_id, @record2.id)
    end
  end
end

RSpec.describe '記録削除', type: :system do
  before do
    @record1 = FactoryBot.create(:record)
    @record2 = FactoryBot.create(:record)
  end
  context '記録の削除ができるとき' do
    it 'ログインしたユーザーは自分が生成した記録の削除ができる' do
      # 記録1を生成したユーザーでログインする
      visit new_user_session_path
      fill_in 'user_email', with: @record1.user.email
      fill_in 'user_password', with: @record1.user.password
      find('input[name="commit"]').click
      # 記録1の詳細ページに遷移する
      visit habit_record_path(@record1.habit_id, @record1.id)
      # [記録を削除]へのリンクがあることを確認する
      expect(page).to have_link '記録を削除', href: habit_record_path(@record1.habit_id, @record1.id)
      # 「記録を削除」ボタンを押すと記録1のユーザーページに遷移し,Recordモデルのカウントが減ることを確認する
      expect{
        page.accept_confirm do
          click_link '記録を削除'
        end
        expect(current_path).to eq(user_path(@record1.user_id))
      }.to change { Record.count }.by(-1)
    end
  end
  context '記録の削除ができないとき' do
    it 'ログインしたユーザーは自分以外が生成した記録の削除画面には遷移できない' do
      # 記録1を生成したユーザーでログインする
      visit new_user_session_path
      fill_in 'user_email', with: @record1.user.email
      fill_in 'user_password', with: @record1.user.password
      find('input[name="commit"]').click
      # 記録2の詳細ページに遷移する
      visit habit_record_path(@record2.habit_id, @record2.id)
      # 「記録を削除」へのリンクがないことを確認する
      expect(page).to have_no_link '記録を削除', href: habit_record_path(@record2.habit_id, @record2.id)
    end
    it 'ログインしていないと記録の削除画面には遷移できない' do
      # 記録1の詳細ページに遷移する
      visit habit_record_path(@record1.habit_id, @record1.id)
      # 「記録を削除」へのリンクがないことを確認する
      expect(page).to have_no_link '記録を削除', href: habit_record_path(@record1.habit_id, @record1.id)
      # 記録2の詳細ページに遷移する
      visit habit_record_path(@record2.habit_id, @record2.id)
      # 「記録を削除」へのリンクがないことを確認する
      expect(page).to have_no_link '記録を削除', href: habit_record_path(@record2.habit_id, @record2.id)
    end
  end
end