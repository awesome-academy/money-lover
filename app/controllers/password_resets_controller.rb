class PasswordResetsController < ApplicationController
  before_action :get_user, :valid_user, :check_expriation, only: %i(edit update)

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t "flash.sent_password_reset"
      redirect_to root_path
    else
      flash[:danger] = t "flash.email_invalid"
      render :new
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add :password, t("error.not_empty")
      render :edit
    elsif @user.update user_params
      log_in @user
      @user.update reset_digest: nil
      flash[:success] = t "flash.success"
      redirect_to @user
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit User::USER_PARAMS_RESET
    end

    def get_user
      @user = User.find_by email: params[:email]
      return if @user
      flash[:info] = t "users.no_account"
      redirect_back_or root_path
    end

    def valid_user
      return if @user&.authenticated?(:reset, params[:id])
      flash[:danger] = t "flash.email_invalid"
      redirect_back_or root_path
    end

    def check_expriation
      return unless @user.password_reset_expired?
      flash[:danger] = t "flash.pass_exp"
      redirect_to new_password_reset_url
    end
end
