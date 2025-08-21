class UserCarebitLog < ApplicationRecord
  belongs_to :user
  belongs_to :carebit_action

  enum status: { picked: 0, completed: 1 }

  validates :performed_on, presence: true
  validates :user_id, uniqueness: { scope: :performed_on, message: "は同じ日に複数のCarebitを登録できません" }
end
