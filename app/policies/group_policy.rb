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

  def add_user_to_principal?
    true
  end

  def remove_user_from_principal?
    true
  end
  def want_join?
    true
  end
  def accept_join?
    true
  end

end
