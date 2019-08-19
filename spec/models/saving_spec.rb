require "rails_helper"

RSpec.describe Saving, type: :model do
  subject {FactoryBot.create :saving}

  context "validations" do
    it {is_expected.to validate_presence_of :saving_in_year}
  end

  context "associations" do
    it {is_expected.to have_many :users}
  end
end
