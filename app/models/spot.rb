class Spot < ApplicationRecord
  # include MultipleUpdate

  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :address, presence: true
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }
end
