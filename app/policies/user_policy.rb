class UserPolicy < ApplicationPolicy
  def edit?
    return true
  end

  def update?
    return true
  end

  def show?
    return true
  end
end
