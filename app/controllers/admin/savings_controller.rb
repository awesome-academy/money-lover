class Admin::SavingsController < Admin::BaseAdminController
  before_action :get_saving, only: %i(edit update destroy)

  def index
    if params[:search].present?
      @savings = Saving.search(format_number params[:search]).page(params[:page]).per Settings.savings_per_page
    else
      @savings = Saving.page(params[:page]).per Settings.savings_per_page
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit; end

  def new
    @saving = Saving.new
  end

  def create
    @saving = Saving.new saving_params
    if @saving.save
      flash[:success] = t("alert.created", obj: Saving.name)
      redirect_to admin_savings_path
    else
      render :new
    end
  end

  def update
    if @saving.update saving_params
      flash[:success] = t("alert.updated", obj: Saving.name)
      redirect_to admin_savings_path
    else
      render :edit
    end
  end

  def destroy
    if @saving.destroy
      flash[:success] = t("alert.deleted", obj: Saving.name)
    else
      flash[:success] = t("alert.delete_failed", obj: Saving.name)
    end
    redirect_to admin_savings_path
  end

  private
    def saving_params
      sav_params = params.require(:saving).permit Saving::SAVING_PARAMS
      sav_params[:saving_in_year] = format_number(sav_params[:saving_in_year]).to_s
      sav_params
    end

    def get_saving
      @saving = Saving.find_by id: params[:id]
      return if @saving
      flash[:danger] = t("alert.not_found", obj: Saving.name)
      redirect_to admin_savings_path
    end
end
