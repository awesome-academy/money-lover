class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.validate.valid_email
  USER_PARAMS = %i(name email phone address username password password_confirmation).freeze

  attr_accessor :remember_token

  validates :name, presence: true, length: {maximum: Settings.validate.max_name}
  validates :email, presence: true, length: {maximum: Settings.validate.max_email}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.validate.min_pass}, allow_nil: true
  validates :address, presence: true, length: {maximum: Settings.validate.max_address}
  validates :phone, presence: true, length: {maximum: Settings.validate.max_phone}
  validates :username, presence: true, length: {maximum: Settings.validate.max_username}

  has_secure_password

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update remember_digest: nil
  end

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end
