class FinancesUserController < ApplicationController
  def create
    finance = Finance.find_by(name: finance_params[:name], category_id: finance_params[:category_id])
    ActiveRecord::Base.transaction do
      finance ||= Finance.create! finance_params
      finances_user = finance.finances_users.build finances_user_params
      return unless finances_user.save!
      flash[:success] = t "flash.success"
    end
    redirect_to month_report_path
  rescue
    flash[:danger] = t("flash.update_fail")
    redirect_to categories_user_index_path
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
