class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.validate.valid_email
  USER_PARAMS = %i(name email phone address username password password_confirmation).freeze

  validates :name, presence: true, length: {maximum: Settings.validate.max_name}
  validates :email, presence: true, length: {maximum: Settings.validate.max_email}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.validate.min_pass}
  validates :address, presence: true, length: {maximum: Settings.validate.max_address}
  validates :phone, presence: true, length: {maximum: Settings.validate.max_phone}
  validates :username, presence: true, length: {maximum: Settings.validate.max_username}

  has_secure_password
end
