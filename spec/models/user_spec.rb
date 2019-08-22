require "rails_helper"

RSpec.describe User, type: :model do
  subject {FactoryBot.create :user}

  describe ".create" do
    it {is_expected.to be_valid}
  end

  context "database" do
    describe "check column" do
      it {is_expected.to have_db_column(:name).of_type :string}
      it {is_expected.to have_db_column(:email).of_type :string}
      it {is_expected.to have_db_column(:phone).of_type :string}
      it {is_expected.to have_db_column(:address).of_type :string}
      it {is_expected.to have_db_column(:avatar).of_type :string}
      it {is_expected.to have_db_column(:username).of_type :string}
      it {is_expected.to have_db_column(:admin).of_type :boolean}
      it {is_expected.to have_db_column(:remember_digest).of_type :string}
      it {is_expected.to have_db_column(:reset_digest).of_type :string}
      it {is_expected.to have_db_column(:reset_sent_at).of_type :datetime}
      it {is_expected.to have_db_column(:month_intense).of_type :float}
      it {is_expected.to have_db_column(:saving_id).of_type :integer}
      it {is_expected.to have_db_column(:created_at).of_type :datetime}
      it {is_expected.to have_db_column(:updated_at).of_type :datetime}
    end
  end

  context "validations" do
    describe "name valid" do
      it {is_expected.to validate_presence_of :name}
      it {is_expected.to validate_length_of(:name).is_at_most Settings.validate.max_name}
    end
    describe "email valid" do
      it {is_expected.to validate_presence_of :email}
      it {is_expected.to validate_length_of(:email).is_at_most Settings.validate.max_email}
      it {expect(subject.email).to match(Settings.validate.valid_email) }
      it {is_expected.to validate_uniqueness_of(:email).case_insensitive}
    end

    describe "password valid" do
      it {is_expected.to have_secure_password}
      it {is_expected.to validate_length_of(:password).is_at_least Settings.validate.min_pass}
    end

    describe "address valid" do
      it {is_expected.to validate_presence_of :address}
      it {is_expected.to validate_length_of(:address).is_at_most Settings.validate.max_address}
    end
    describe "phone valid" do
      it {is_expected.to validate_presence_of :phone}
      it {is_expected.to validate_length_of(:phone).is_at_most Settings.validate.max_phone}
    end
    describe "username valid" do
      it {is_expected.to validate_presence_of :username}
      it {is_expected.to validate_length_of(:username).is_at_most Settings.validate.max_username}
    end

    describe "month_intense valid" do
      it {should validate_presence_of(:month_intense).allow_nil}
      it {is_expected.to validate_uniqueness_of(:month_intense)}
      it {should validate_numericality_of(:month_intense).is_greater_than Settings.zero}
    end
  end

  context "associations" do
    it {is_expected.to have_many(:finances_users).dependent :destroy}
    it {should have_many(:finances).through :finances_users}
    it {should accept_nested_attributes_for :finances_users}
    it {is_expected.to have_many(:categories_users).dependent :destroy}
    it {should have_many(:categories).through(:categories_users)}
    it {should belong_to(:saving).optional}
  end

  context "indexes" do
    it {should have_db_index :saving_id}
    it {should have_db_index [:name, :username, :email, :phone, :address]}
  end
end
