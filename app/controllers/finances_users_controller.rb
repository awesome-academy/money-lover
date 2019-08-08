class FinancesUsersController < ApplicationController
  before_action :get_finances_user, only: %i(update destroy edit)

  def edit
    @categories_user = Category.by_user current_user.id
    respond_to :js
  end

  def update
    if @finances_user.update finances_user_params_form2
      flash[:success] = t "flash.update_success"
      redirect_to month_report_path
    else
      flash[:error] = t "flash.update_error"
      render :edit
    end
  end

  def destroy
    if @finances_user.destroy
      flash[:success] = t "alert.deleted"
    else
      flash[:error] = t "alert.delete_failed"
    end
    redirect_to month_report_path
  end

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
      flash[:danger] = t "flash.update_fail"
      redirect_to categories_user_index_path
  end

  private
    def finances_user_params
      fina_user_params = params.require(:transaction).permit FinancesUser::FINANCES_USER_PARAMS
      fina_user_params[:amout] = format_number(fina_user_params[:amout]).to_s
      fina_user_params
    end

    def finances_user_params_form2
      fina_user_params = params.require(:finances_user).permit FinancesUser::FINANCES_USER_PARAMS
      fina_user_params[:amout] = format_number(fina_user_params[:amout]).to_s
      fina_user_params
    end

    def finance_params
      params.require(:transaction).permit Finance::FINANCE_PARAMS
    end

    def get_finances_user
      @finances_user = FinancesUser.find_by id: params[:id]
      return if @finances_user
      flash[:error] = t("alert.not_found", obj: FinancesUser.name)
      redirect_to month_report_path
    end
end
