require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @event = build(:event)
  end

  it '名前がなければ登録できない' do
    expect(FactoryBot.build(:event, name: '')).to_not be_valid
  end

  it '場所がなければ登録できない' do
    expect(FactoryBot.build(:event, place: '')).to_not be_valid
  end

  it 'コメントがなければ登録できない' do
    expect(FactoryBot.build(:event, content: '')).to_not be_valid
  end
  it 'スタート時間がなければ登録できない' do
    expect(FactoryBot.build(:event, start_at: '')).to_not be_valid
  end

  it 'エンド時間がなければ登録できない' do
    expect(FactoryBot.build(:event, end_at: '')).to_not be_valid
  end

  it '時間が逆行していると登録できない' do
    @event.start_at = '2020-01-09 18:30:00.271231'
    @event.end_at = '2020-01-01 18:30:00.271231'
    @event.valid?
  end

  it '名前が50以下でないと死ぬ' do
    @event.name = 'a' * 51
    @event.valid?
  end

  it '場所名が50以下でないと' do
    @event.name = 'a' * 51
    @event.valid?
  end

  it '詳細が2000以下でないといけない' do
    @event.content = 'a' * 20001
    @event.valid?
  end

end
