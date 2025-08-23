class UserCarebitLogsController < ApplicationController
  before_action :authenticate_user!

  def complete
    log = current_user.user_carebit_logs.find(params[:id])
    log.update!(
      status: :completed,
      completed_at: Time.current,
      diary_note: params[:user_carebit_log][:diary_note]
    )

    redirect_to mypage_path, notice: "今日のCarebitを完了しました！"
  end
end
