class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # need to update to .where user = record.user or admin
    end
  end

  def create?
    true
  end

  # edit calls update in the application controller so not needed

  # def edit?
  #   # if the user is the owner of the order then true
  #   # otherwise false
  #   # user = current_user
  #   # record = @order (argument passed to authorize)
  #  user == record.user
  # end


  def new?
    true
  end

  def update?
    user == record.user || user.admin
  end

  def destroy?
    # needs to be updated to only admin
    user == user.admin
  end

end
