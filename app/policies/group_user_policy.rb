class GroupUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true # Tous les users peuvent créer un group
  end
  def new?
    true # Tous les users peuvent créer un group
  end

  def show?
    true # Tous les users peuvent voir tous les groups
  end


  def destroy?
    true
  end

  def want_join?
    true
  end

  def accept_join?
    true
  end

end
