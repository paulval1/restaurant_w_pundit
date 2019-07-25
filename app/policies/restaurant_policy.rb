class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # anyone can view any restaurant
      scope.all
      # display only restaurants  of owner:
      # scope.where(user: user)
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?  don't need edit any more than new bcos
  #            ApplicationPolicy parent callse create?/update? anyway
  #   # our rule here: can edit if I created the restaurant
  #   record.user == user
  # end

  def update?
    #  can update if I am the owner
    user_is_owner?
  end

  def destroy?
    # 1. admin can destroy

    # 2. owner can destroy
    user_is_owner? # Only restaurant creator can destroy it
  end

  private

  def user_is_owner?
    record.user == user
  end
end
