 class CustomerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def new?
      record.user == user
    end

    def create?
      record.user == user
    end

    def show?
      record.user == user
    end

  end
