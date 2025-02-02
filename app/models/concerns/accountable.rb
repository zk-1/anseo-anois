module Accountable
  extend ActiveSupport::Concern

  included do
    has_one :account, as: :accountable, touch: true
    delegate :owner, :replaced, :replacements, to: :account
  end
end
