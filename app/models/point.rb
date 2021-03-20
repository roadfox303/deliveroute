class Point < ApplicationRecord
  # include MultipleUpdate
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
end
