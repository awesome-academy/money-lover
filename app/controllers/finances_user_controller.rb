class FinancesUserController < ApplicationController
  def create
    finance = Finance.new finance_params
    if finance.save
      finances_user = finance.finances_users.build finances_user_params
      if finances_user.save
        flash[:success] = t "flash.success"
      else
        flash[:danger] = t "flash.update_fail1"
      end
    else
      flash[:danger] = t "flash.update_fail"
    end
    redirect_to month_report_path
  end

  private
    def finances_user_params
      fina_user_params = params.require(:transaction).permit FinancesUser::FINANCES_USER_PARAMS
      fina_user_params[:amout] = format_number(fina_user_params[:amout]).to_s
      fina_user_params
    end

    def finance_params
      params.require(:transaction).permit Finance::FINANCE_PARAMS
    end
end
