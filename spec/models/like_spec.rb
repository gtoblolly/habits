require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe "いいね機能" do
    context "いいねできる場合" do
      it "ユーザーと記録が紐づいていれば保存できる" do
      end
      it "ユーザーが同じでも記録が違えばいいねできる" do
      end
      it "記録が同じでもユーザーが違えばいいねできる" do
      end
    end
    context 'いいねできない場合' do
      it "ユーザーが紐付いていなければ投稿できない" do
      end
      it "記録が紐付いていなければ投稿できない" do
      end
    end
  end
end
