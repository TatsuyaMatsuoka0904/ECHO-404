require 'rails_helper'

RSpec.describe Studio, type: :model do
  before(:each) do
    @studio = build(:studio)
  end
  it 'ユーザー登録ができる' do
    expect(@studio).to be_valid
  end
  it '名前,住所,メールアドレス,パスワードがあれば登録できる' do
    expect(FactoryBot.create(:studio)).to be_valid
  end

  it '名前がなければ登録できない' do
    expect(FactoryBot.build(:studio, name: '')).to_not be_valid
  end

  it 'メールアドレスがなければ登録できない' do
    expect(FactoryBot.build(:studio, email: '')).to_not be_valid
  end

  it 'メールアドレスが重複していたら登録できない' do
    studio1 = FactoryBot.create(:studio, name: 'test', email: 'test@example.com')
    expect(FactoryBot.build(:studio, name: 'atest', email: studio1.email)).to_not be_valid
  end

  it 'パスワードがなければ登録できない' do
    expect(FactoryBot.build(:studio, password: '')).to_not be_valid
  end

  it '住所がなければ登録できない' do
    expect(FactoryBot.build(:studio, address:'')).to_not be_valid
  end

  it 'password_confirmationとpasswordが異なる場合保存できない' do
    expect(FactoryBot.build(:studio, password: 'password', password_confirmation: 'p')).to_not be_valid
  end
end
