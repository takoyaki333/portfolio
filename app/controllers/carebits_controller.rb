class CarebitsController < ApplicationController
  before_action :authenticate_user!

  # カテゴリごとにランダムで1つ選ぶ
  def select
    @mental_action   = CarebitAction.mental.sample
    @physical_action = CarebitAction.physical.sample
    @lifestyle_action = CarebitAction.lifestyle.sample
  end

  # 選択されたアクションをログに保存
  def choose
    action = CarebitAction.find(params[:carebit_action_id])

    log = current_user.user_carebit_logs.new(
      carebit_action: action,
      performed_on: Date.today,
      status: :picked
    )

    if log.save
      redirect_to carebit_select_path, notice: "今日のCarebitを選択しました！"
    else
      redirect_to carebit_select_path, alert: "同じ日に複数のCarebitは選択できません。"
    end
  end
end
