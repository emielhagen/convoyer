class ConvoyPolicy < ApplicationPolicy
  def create?
    return true
  end

  def new?
    return true
  end

  def edit?
    return true
  end

  def update?
    return true
  end

  def destroy?
    return true
  end
end
