class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def show
    true
  end
  def edit?
    true
  end
  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end

end
