class RecomandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def recomandation?
    true # Tous les users peuvent créer une recomandation
  end

  def create?
    true # Tous les users peuvent créer une recomandation
  end

  def show?
    true # Tous les users peuvent voir toutes les recomandations
  end

  def destroy?
    true
  end

  def update?
    true
  end
end
