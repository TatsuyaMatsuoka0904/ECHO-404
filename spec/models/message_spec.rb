require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:each) do
    @message = build(:message)
  end

  # it 'メッセージを登録できる' do
  #   expect(FactoryBot.build(:message)).to be_valid
  # end
end
