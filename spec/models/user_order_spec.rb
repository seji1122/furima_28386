require 'rails_helper'
describe UserOrder do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('spec/camera.png')
    @item.save
    @userorder = FactoryBot.build(:user_order,item_id: @item.id, user_id: @user.id)
    
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'post_coad、city、banchi、phone_num、purchase_id、が存在すれば購入できる' do
      end
      it 'phone_numが11文字以内であれば登録できる' do
        @userorder.phone_num = '09012345678'
        expect(@userorder).to be_valid
      end

      it 'post_coadにハイフンがあれば登録できる' do
        @userorder.post_coad = '123-4567'
        expect(@userorder).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'post_coadが空だと登録できない' do
        @userorder.post_coad = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Post coad can't be blank", "Post coad is invalid. Include hyphen(-)")
      end
      it 'cityが空だと登録できない' do
        @userorder.city = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("City can't be blank")
      end
      it 'banchiが空だと登録できない' do
        @userorder.banchi = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Banchi can't be blank")
      end
      it 'phone_numが空だと登録できない' do
        @userorder.phone_num = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numにハイフンがあると登録できない' do
        @userorder.phone_num = '090-1234-5678'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Phone num is invalid")
      end
    end
  end
end