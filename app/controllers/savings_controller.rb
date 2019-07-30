class SavingsController < ApplicationController
  def new
    @saving = Saving.new
  end

  def create
    number_format = format_number saving_params[:saving_in_year]
    saving = Saving.find_by saving_in_year: number_format
    ActiveRecord::Base.transaction do
      saving ||= Saving.create saving_in_year: number_format
      return unless current_user.update! saving_id: saving.id
      flash[:success] = t "flash.success"
    end
    redirect_to month_report_path
  rescue
    flash[:danger] = t("flash.update_fail")
    redirect_to month_report_path
  end

  private
    def saving_params
      params.require(:saving).permit Saving::SAVING_PARAMS
    end
end
