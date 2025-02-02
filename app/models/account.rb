class Account < ApplicationRecord
  DELEGATED_TYPES = [ InstagramAccount, BlueskyAccount ]

  delegated_type :accountable, types: DELEGATED_TYPES.map(&:name), dependent: :destroy
  accepts_nested_attributes_for :accountable

  belongs_to :owner, class_name: "User", inverse_of: :accounts
  has_many :replacement_records, class_name: "AccountReplacement", foreign_key: :replaced_id, inverse_of: :replaced
  has_many :replacements, through: :replacement_records, source: :replacement
  has_many :replaced_records, class_name: "AccountReplacement", foreign_key: :replacement_id, inverse_of: :replacement
  has_many :replaced, through: :replaced_records, source: :replaced
  has_many :share_codes, as: :share_code_protectable, dependent: :destroy

  delegate :platform_name, :menu_name, to: :accountable, allow_nil: true
end
