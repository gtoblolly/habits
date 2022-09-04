require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe "いいね機能" do
    context "いいねできる場合" do
      it "ユーザーと記録が紐づいていれば保存できる" do
        expect(@like).to be_valid
      end
      it "ユーザーが同じでも記録が違えばいいねできる" do
        another_like = FactoryBot.create(:like)
        expect(FactoryBot.create(:like, user_id: another_like.user_id)).to be_valid
      end
      it "記録が同じでもユーザーが違えばいいねできる" do
        another_like = FactoryBot.create(:like)
        expect(FactoryBot.create(:like, record_id: another_like.record_id)).to be_valid
      end
    end
    context 'いいねできない場合' do
      it "ユーザーが紐付いていなければ投稿できない" do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Userを入力してください")
      end
      it "記録が紐付いていなければ投稿できない" do
        @like.record = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Recordを入力してください")
      end
    end
  end
end