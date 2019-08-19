require "rails_helper"

RSpec.describe Finance, type: :model do
  context "associations" do
    it "is have many finances_users" do
      is_expected.to have_many(:finances_users).dependent :destroy
    end

    it "is have many users" do
      is_expected.to have_many(:users).through :finances_users
    end

    it "is belong to category" do
      is_expected.to belong_to :category
    end

    it "is accept nested attribute for finances user" do
      is_expected.to accept_nested_attributes_for :finances_users
    end
  end

  context "database" do
    it "is type of name is string" do
      should have_db_column(:name).of_type :string
    end

    it "is have column category_id" do
      should have_db_column(:category_id)
    end
  end

  context "delegate" do
    it "is haved delegate name" do
      should delegate_method(:name).to(:category).with_prefix :cate
    end
  end

  context "validates" do
    it "is invalid without a name" do
      is_expected.to validate_presence_of :name
    end

    it "is invalid without a category_id" do
      is_expected.to validate_presence_of :category_id
    end
  end
end
