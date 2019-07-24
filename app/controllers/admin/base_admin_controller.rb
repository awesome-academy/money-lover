class Admin::BaseAdminController < ApplicationController
  before_action :auth_admin
  layout "application_admin"

  def auth_admin; end
end
