class FinancesUser < ApplicationRecord
  belongs_to :user
  belongs_to :finance
end
