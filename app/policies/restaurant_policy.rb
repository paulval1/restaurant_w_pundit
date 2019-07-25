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
    record.user == user
  end

  def destroy?
    record.user == user  # Only restaurant creator can destroy it
  end
end
