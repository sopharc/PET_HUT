class PagesController < ApplicationController
  skip_after_action :verify_authorized, only: [:home]
  skip_before_action :authenticate_user!, only: [ :home, :components ]

  def home
    true
  end

  def components
  end
end
