class Admin::UsersController < Admin::BaseAdminController
  before_action :get_user, except: %i(index new create search)

  def index
    if params[:search].present?
      @users = User.search(params[:search]).page(params[:page]).per Settings.users_per_page
    else
      @users = User.page(params[:page]).per Settings.users_per_page
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t("alert.created", obj: User.name)
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t("alert.updated", obj: User.name)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t("alert.deleted", obj: User.name)
    else
      flash[:success] = t("alert.delete_failed", obj: User.name)
    end
    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit User::USER_PARAMS
    end

    def get_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = t("alert.not_found", obj: User.name)
      redirect_to admin_users_path
    end
end
