class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true # Tous les users peuvent créer un group
  end

  def show?
    true # Tous les users peuvent voir tous les groups
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end

  def add?
    true
  end

  def remove_user
    true
  end
end
