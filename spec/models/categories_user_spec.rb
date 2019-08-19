require "rails_helper"

RSpec.describe CategoriesUser, type: :model do
  let!(:categories_user) {FactoryBot.create :categories_user}
  let!(:categories_user2) {FactoryBot.create :categories_user} 
  subject {categories_user}

  describe "Associations" do
    it "belongs to user" do
      association = described_class.reflect_on_association :user
      expect(association.macro).to eq :belongs_to
    end

    it "belongs to category" do
      association = described_class.reflect_on_association :category
      expect(association.macro).to eq :belongs_to
    end
  end

  describe "Database" do
    it "is type of name is string" do
      should have_db_column(:user_id).of_type :integer
    end

    it "is have column category_id" do
      should have_db_column(:category_id).of_type :integer
    end
  end

  describe "scope" do
    it "by user id" do
      expect(CategoriesUser.by_user_id(categories_user.user_id)).to match_array([categories_user])
    end
    it "except user id" do
      expect(CategoriesUser.no_by_user(categories_user.user_id)).to match_array([categories_user2])
    end
  end
end
