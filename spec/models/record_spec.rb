require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

  describe "記録の保存" do
    context "記録の保存ができる場合" do
      it "ユーザーと習慣が紐づいていて、記録内容と画像が存在すれば保存できる" do
        expect(@record).to be_valid
      end
      it "記録内容と画像は空でも保存できること" do
        @record.image = ""
        @record.text = ""
        expect(@record).to be_valid
      end
    end
    context "記録が保存できない場合" do
      it "ユーザーが紐付いていなければ投稿できない" do
        @record.user = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Userを入力してください")
      end
      it "習慣が紐付いていなければ投稿できない" do
        @record.habit = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("習慣を入力してください")
      end
    end
  end
end
