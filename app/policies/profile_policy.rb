class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def show
    true
  end
  def new?
    true # Tous les users peuvent créer une prestation
  end

  def create?
    true # Tous les users peuvent créer une prestation
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
