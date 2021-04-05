class User < ApplicationRecord
  validates_presence_of :name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password, require: true
  has_secure_password
  has_many :items

  enum role: %w(admin)
end
