require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

  describe "記録の保存" do
    context "記録の保存ができる場合" do
      it "ユーザーと習慣が紐づいていて、記録内容と画像が存在すれば保存できる" do
      end
      it "記録内容と画像は空でも保存できること" do
      end
    end
    context "記録が保存できない場合" do
      it "ユーザーが紐付いていなければ投稿できない" do
      end
      it "習慣が紐付いていなければ投稿できない" do
      end
    end
  end
end
