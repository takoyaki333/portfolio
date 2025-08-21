class CarebitAction < ApplicationRecord
  enum category: { mental: 0, physical: 1, lifestyle: 2 }
  validates :title, presence: true

  has_many :user_carebit_logs, dependent: :destroy
end
