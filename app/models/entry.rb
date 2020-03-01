class Entry < ApplicationRecord
  # belongs_to :author, class_name: "User", foreign_key: "user_id"

  class << self
    # def status_text(status)
      # I18n.t("activerecord.attributes.entry.status_#{status}")
    # end
  end
end
