class BlueskyAccount < ApplicationRecord
  include Accountable

  class << self
    def platform_name
      "Bluesky"
    end
  end

  def platform_name
    self.class.platform_name
  end

  def menu_name
    "Bluesky: @#{handle}.bsky.social"
  end

  def account_name
    handle
  end

  def url
    "https://bsky.app/profile/#{handle}"
  end
end
