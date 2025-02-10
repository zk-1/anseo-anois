class ShareCode < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  belongs_to :share_code_protectable, polymorphic: true

  before_validation :generate_code, :ensure_creator!

  attribute :active, :boolean, default: true

  def protectable_url
    "https://#{ENV["SITE_DOMAIN"]}/?sc=#{code}"
  end

  private

  def generate_code
    self.code = loop do
      random_code = SecureRandom.hex(10)
      break random_code unless ShareCode.exists?(code: random_code)
    end
  end

  def ensure_creator!
    self.creator = share_code_protectable&.owner if self.creator.nil?
  end
end
