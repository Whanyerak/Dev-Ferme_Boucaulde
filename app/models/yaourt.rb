class Yaourt < ApplicationRecord
  scope :disabled, -> { where(disabled: true) }

  def self.default
    @@default ||= find_by_name("Nature")
  end
end
