class InstagramAccount < ApplicationRecord
  include Accountable

  class << self
    def platform_name
      "Instagram"
    end
  end

  def menu_name
    "Instagram: #{username}"
  end
end
