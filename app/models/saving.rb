class Saving < ApplicationRecord
  SAVING_PARAMS = %i(saving_in_year).freeze
  has_many :users, dependent: :nullify

  validates :saving_in_year, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: Settings.zero}
end
