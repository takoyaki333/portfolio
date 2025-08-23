class AchievementsController < ApplicationController
  before_action :authenticate_user!

  def index
    # 集計対象期間
    period = params[:period] == "month" ? Time.current.all_month : nil

    # 完了ログ取得
    @logs = current_user.user_carebit_logs.completed.includes(:carebit_action)
    @logs = @logs.where(performed_on: period) if period

    # カテゴリ別の達成数
    @stats = @logs.joins(:carebit_action).group("carebit_actions.category").count

    # 全アクション数（カテゴリごと）
    @totals = CarebitAction.group(:category).count
  end
end
