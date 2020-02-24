class Member < ApplicationRecord::Base
  include EmailAddressChecker

has_many :entries, dependent: :destroy

  class << self
    validates :number, present: true
    numericality: { only_integer: true,
    greater_than: 0, less_than: 100, allow_blank: true },
    uniqueness: true

    validates :name, presence: true,
     format: {with: /\A[A-Za-z]\w*\z/, allow_blank: true },
     length: {minimum: 2, maximum: 20, allow_blank: true},
     uniqueness: {case_sensitive: false }

     attr_accessor :password, :password_confirmation

    def search(query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ?",
        "%#{query}%")
      end
      rel
    end


  end
end
