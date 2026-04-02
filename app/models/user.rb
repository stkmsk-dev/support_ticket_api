class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :tickets

  before_create :generate_api_token

  private

  def generate_api_token
    self.api_token = SecureRandom.hex(20)
  end
end
