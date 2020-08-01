class PagesController < ApplicationController
  include Pundit
    skip_after_action :verify_authorized, only: [:home]
    skip_before_action :authenticate_user!, only: [ :home, :components ]


  def home
  end

  def components
  end
end
