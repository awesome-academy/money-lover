require "rails_helper"

RSpec.describe FinancesUser, type: :model do
  let!(:category){FactoryBot.create :category}
  let!(:user){FactoryBot.create :user}
  let!(:finance){FactoryBot.create :finance, category_id: category.id}
  let!(:finances_user){FactoryBot.create :finances_user, user_id: user.id, finance_id: finance.id}
  subject {finances_user}

  context "validations" do
    describe "amout valid" do
      it {is_expected.to validate_presence_of :amout}
      it {should validate_numericality_of(:amout).is_greater_than Settings.zero}
    end

    describe "date valid" do
      it {is_expected.to validate_presence_of :date}
    end
  end

  context "associations" do
    it {should belong_to :user}
    it {should belong_to :finance}
  end

  context "scope" do
    describe "scope by_user_id" do
      it {expect(FinancesUser.by_user_id(user.id).last.user_id).to eq(user.id)}
    end

    describe "scope by_status" do
      it {expect(FinancesUser.by_status(finances_user.status).last.status).to eq(finances_user.status)}
    end

    describe "scope permanent" do
      it {expect(FinancesUser.permanent.last.status).to eq(true)}
    end
  end
end
