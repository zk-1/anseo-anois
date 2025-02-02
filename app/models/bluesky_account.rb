class BlueskyAccount < ApplicationRecord
  include Accountable

  class << self
    def platform_name
      "Bluesky"
    end
  end

  def menu_name
    "Bluesky: #{handle}"
  end
end
