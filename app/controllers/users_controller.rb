class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)

  def new
    @user = User.new
  end

  def show; end
  
  def edit; end;

  def update
    if @user.update user_params
      flash[:success] = t "flash.update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "flash.created_account"
      redirect_to @user
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit User::USER_PARAMS    
    end

    def load_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:info] = t "flash.no_account"
      redirect_to root_path
    end
end
