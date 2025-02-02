class AccountReplacement < ApplicationRecord
  belongs_to :replaced, class_name: "Account", inverse_of: :replacement_records
  belongs_to :replacement, class_name: "Account", inverse_of: :replaced_records
  belongs_to :creator, class_name: "User", inverse_of: :replacements

  before_validation :ensure_creator!

  private

  def ensure_creator!
    self.creator = replaced&.owner if self.creator.nil?
  end
end
