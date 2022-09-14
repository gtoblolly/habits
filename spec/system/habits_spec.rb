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
      expect(page).to have_content(@habit_title)
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

RSpec.describe '習慣編集', type: :system do
  before do
    @habit1 = FactoryBot.create(:habit)
    @habit2 = FactoryBot.create(:habit)
  end
  context '習慣の編集ができるとき' do
    it 'ログインしたユーザーは自分が生成したした習慣の編集ができる' do
      # 習慣1を生成したユーザーでログインする
      visit new_user_session_path
      fill_in 'user_email', with: @habit1.user.email
      fill_in 'user_password', with: @habit1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 習慣1の詳細ページに遷移する
      visit habit_path(@habit1.id)
      # [習慣を編集]へのリンクがあることを確認する
      expect(page).to have_link '習慣を編集', href: edit_habit_path(@habit1)
      # 習慣編集ページへ遷移する
      visit edit_habit_path(@habit1)
      # すでに生成済みの内容がフォームに入っていることを確認する
      expect(
        find('#habit_title').value
      ).to eq @habit1.title
      expect(
        find('#habit_content').value
      ).to eq @habit1.content
      # 習慣内容を編集する
      fill_in 'habit_title', with: "#{@habit1.title}+編集した習慣名"
      fill_in 'habit_content', with: "#{@habit1.content}+編集した習慣内容"
      # 編集してもHabitモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Habit.count }.by(0)
      # 習慣詳細ページに遷移したことを確認する
      expect(current_path).to eq(habit_path(@habit1.id))
      # 習慣詳細ページには先ほど変更した内容の習慣が存在することを確認する（習慣名）
      expect(page).to have_content("#{@habit1.title}+編集した習慣名")
      # 習慣詳細ページには先ほど変更した内容の習慣が存在することを確認する（習慣内容）
      expect(page).to have_content("#{@habit1.content}+編集した習慣内容")
    end
  end
  context '習慣の編集ができないとき' do
    it 'ログインしたユーザーは自分以外が生成した習慣の編集画面には遷移できない' do
      # 習慣1を生成したユーザーでログインする
      visit new_user_session_path
      fill_in 'user_email', with: @habit1.user.email
      fill_in 'user_password', with: @habit1.user.password
      find('input[name="commit"]').click
      # 習慣2の習慣詳細ページへ遷移する
      visit habit_path(@habit2.id)
      # 「習慣を編集」へのリンクがないことを確認する
      expect(page).to have_no_link '習慣を編集', href: edit_habit_path(@habit2)
    end
    it 'ログインしていないと習慣の編集画面には遷移できない' do
      # 習慣1の習慣詳細ページへ遷移する
      visit habit_path(@habit1.id)
      # 「習慣を編集」へのリンクがないことを確認する
      expect(page).to have_no_link '習慣を編集', href: edit_habit_path(@habit1)
      # 習慣2の習慣詳細ページへ遷移する
      visit habit_path(@habit2.id)
      # 「習慣を編集」へのリンクがないことを確認する
      expect(page).to have_no_link('習慣を編集'), href: edit_habit_path(@habit2)
    end
  end
end

RSpec.describe '習慣削除', type: :system do
  before do
    @habit1 = FactoryBot.create(:habit)
    @habit2 = FactoryBot.create(:habit)
  end
  context '習慣の削除ができるとき' do
    it 'ログインしたユーザーは自分が生成した習慣の削除ができる' do
      # 習慣1を生成したユーザーでログインする
      # 習慣1のユーザーページに遷移する
      # 習慣1のユーザーページには習慣1のタイトルがあることを確認する
      # 習慣1の詳細ページに遷移する
      # 「習慣を削除」ボタンがあることを確認する
      # 「習慣を削除」ボタンを押すとHabitモデルのカウントが減ることを確認する
      # 習慣1のユーザーページに遷移したことを確認する
      # 習慣1のユーザーページには習慣1のタイトルがないことを確認する
    end
  end
  context '習慣の削除ができないとき' do
    it 'ログインしたユーザーは自分以外が生成した習慣の削除画面には遷移できない' do
      # 習慣1を生成したユーザーでログインする
      # 習慣2のユーザーページに遷移する
      # 習慣2のユーザーページには習慣2のタイトルがあることを確認する
      # 習慣2の詳細ページに遷移する
      # 「習慣を削除」ボタンがないことを確認する
    end
    it 'ログインしていないと習慣の削除画面には遷移できない' do
      # 習慣1のユーザーページに遷移する
      # 習慣1のユーザーページには習慣1のタイトルがあることを確認する
      # 習慣1の詳細ページに遷移する
      # 「習慣を削除」ボタンがないことを確認する
      # 習慣2のユーザーページに遷移する
      # 習慣2のユーザーページには習慣2のタイトルがあることを確認する
      # 習慣2の詳細ページに遷移する
      # 「習慣を削除」ボタンがないことを確認する
    end
  end
end