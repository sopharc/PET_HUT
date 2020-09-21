class PagesController < ApplicationController
  include Pundit
    skip_after_action :verify_authorized, only: [:home, :failure]
    skip_before_action :authenticate_user!, only: [ :home, :components, :failure]


  def home
    true
  end

  def failure
  end

  def components
  end
end
