class MypagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @today_log = current_user.user_carebit_logs.find_by(performed_on: Date.today)
    @logs = current_user.user_carebit_logs

    # カレンダーの基準日を明示的にセット、前月翌月のリンクのため
    @start_date = params.fetch(:start_date, Date.today).to_date
  end
end
