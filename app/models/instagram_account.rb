class InstagramAccount < ApplicationRecord
  include Accountable

  class << self
    def platform_name
      "Instagram"
    end
  end

  def platform_name
    self.class.platform_name
  end

  def menu_name
    "Instagram: @#{username}"
  end

  def account_name
    username
  end

  def url
    "https://www.instagram.com/#{username}"
  end
end
