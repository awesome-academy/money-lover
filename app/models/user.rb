class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.validate.valid_email
  USER_PARAMS = %i(name email phone address username password password_confirmation).freeze
  USER_PARAMS_RESET = %i(password, password_confirmation)
  USER_PARAMS_MONTH_INTENSE = %i(month_intense).freeze

  attr_accessor :remember_token, :reset_token

  has_many :finances_users, dependent: :destroy
  has_many :finances, through: :finances_users

  has_many :categories_users, dependent: :destroy
  has_many :categories, through: :categories_user

  belongs_to :saving, optional: true

  validates :name, presence: true, length: {maximum: Settings.validate.max_name}
  validates :email, presence: true, length: {maximum: Settings.validate.max_email}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.validate.min_pass}, allow_nil: true
  validates :address, presence: true, length: {maximum: Settings.validate.max_address}
  validates :phone, presence: true, length: {maximum: Settings.validate.max_phone}
  validates :username, presence: true, length: {maximum: Settings.validate.max_username}
  validates :month_intense, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: Settings.zero}, allow_nil: true

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

  def create_reset_digest
    self.reset_token = User.new_token
    update reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < Settings.password_reset.time.hours.ago
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
