class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    filter
  end

  def show?
    true
  end

  private
  def filter
    @filter = params[:query] if params.has_key?(:query)
  end

end
