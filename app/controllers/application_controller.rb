class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authorize_admin
    redirect_to :back, status: 401 unless current_user.admin
    #redirects to previous page
  end
end
