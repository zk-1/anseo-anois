class User < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :social_media_accounts, dependent: :destroy

  normalizes :email, with: ->(e) { e.strip.downcase }
end
