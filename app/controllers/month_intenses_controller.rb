class MonthIntensesController < ApplicationController
  before_action :logged_in_user, only: :create

  def new; end

  def create
    number_format = format_number user_params[:month_intense]
    if current_user.update month_intense: number_format
      flash[:success] = t "flash.success"
    else
      flash[:danger] = t "flash.update_fail"
    end
    redirect_to month_report_path
  end

  private
    def user_params
      params.require(:month_intense).permit User::USER_PARAMS_MONTH_INTENSE
    end
end
