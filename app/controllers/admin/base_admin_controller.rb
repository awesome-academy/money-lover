class Admin::BaseAdminController < ApplicationController
  include SessionsHelper
  include AdminHelper

  before_action :auth_admin
  layout "application_admin"

  private
    def auth_admin
      return if admin?
      redirect_to month_report_path
    end
end
