require 'rails_helper'

RSpec.describe "記録登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @habit = FactoryBot.create(:habit)
    @record_text = Faker::Lorem.sentence
    @record_image = Faker::Lorem.sentence
  end
  context '記録できるとき' do
    it 'ログインしたユーザーは記録できる' do
      # ログインする
      # 「記録する」ボタンがあることを確認する
      # 記録作成画面へ遷移する
      # フォームに情報を入力する
      # 「記録を作成する」ボタンを押すとRecordモデルのカウントとHabitモデルの合計経験値が1上がることを確認する
      # マイページに遷移することを確認する
      # マイページに先ほどの記録が存在することを確認する
			# ５回記録すると習慣レベルが１上がることを確認する
    end
	end
	context '記録できないとき'do
    it 'ログインしていないとページに遷移できない' do
      # トップページに遷移する
			# 「記録する」ボタンがあることを確認する
			# 「記録する」ボタンを押すとログインページに遷移する
      #
    end
  end
end