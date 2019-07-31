class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      if admin?
        redirect_to admin_path
      else
        redirect_to month_report_path
      end
    else
      flash.now[:danger] = t "flash.invalid_account"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
