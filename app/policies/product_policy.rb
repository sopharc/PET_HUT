class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve

      if @filter.present?
        scope.where(category: @filter)
      else
        scope.all
      end
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
