class CarebitAction < ApplicationRecord
  enum category: { mental: 0, physical: 1, lifestyle: 2 }
  validates :title, presence: true
end
