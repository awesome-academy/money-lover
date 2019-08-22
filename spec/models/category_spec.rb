require "rails_helper"

RSpec.describe Category, type: :model do
  let(:category_root) {FactoryBot.create :category, parent_id: nil}
  let(:category_child_list) {FactoryBot.create_list(:category, 2, parent_id: category_root.id)}
  let(:user) {FactoryBot.create :user}
  let!(:categories_user) {FactoryBot.create :categories_user, category_id: category_root.id, user_id: user.id}
  subject {FactoryBot.create :category}

  describe ".create" do
    it {is_expected.to be_valid}
  end

  context "database" do
    it {is_expected.to have_db_column(:name).of_type :string}
    it {is_expected.to have_db_column(:parent_id).of_type :integer}
    it {is_expected.to have_db_column(:created_at).of_type :datetime}
    it {is_expected.to have_db_column(:updated_at).of_type :datetime}
  end

  context "validations" do
    describe "name valid" do
      it {is_expected.to validate_presence_of :name}
    end
  end

  context "associations" do
    it {should have_many(:categories_users).dependent :destroy}
    it {should have_many(:users).through :categories_users}
    it {should have_many(:finances).dependent :destroy}
    it {should belong_to(:parent_category).class_name(Category.name).with_foreign_key("parent_id").optional}
    it {should have_many(:child_categories).class_name(Category.name).with_foreign_key("parent_id")}
  end

  context "callbacks" do
    describe "change root id" do
      it {should callback(:change_root_id).before :save}
    end
  end

  context "scope" do
    describe ".root_category" do
      it {expect(Category.root_category).to include category_root}
    end

    describe ".child_categories_default" do
      it {expect(Category.child_categories_default category_root.id).to match_array category_child_list}
    end

    describe ".category_select" do
      it {expect(Category.category_select category_root.id).to match_array category_child_list}
    end

    describe ".by_user" do
      it {expect(Category.by_user user.id).to match_array [category_root]}
    end

    describe ".default_category" do
      it {expect(Category.default_category).to match_array category_child_list}
    end
  end
end
