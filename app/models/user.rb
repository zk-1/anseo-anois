class User < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :accounts, foreign_key: :owner_id, inverse_of: :owner, dependent: :destroy
  has_many :account_replacements, inverse_of: :creator, foreign_key: :creator_id, dependent: :destroy
  has_many :replacements, through: :account_replacements, foreign_key: :owner_id
  has_many :replaced, through: :account_replacements, foreign_key: :owner_id
  has_many :instagram_accounts, through: :accounts, source: :accountable, source_type: "InstagramAccount"
  has_many :bluesky_accounts, through: :accounts, source: :accountable, source_type: "BlueskyAccount"
  has_many :share_codes, as: :share_code_protectable, dependent: :destroy
  has_many :owned_share_codes, class_name: "ShareCode", foreign_key: :creator_id, dependent: :destroy

  normalizes :email, with: ->(e) { e.strip.downcase }

  def owner
    self
  end
end
