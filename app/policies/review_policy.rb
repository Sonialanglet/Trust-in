class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true # Tous les users peuvent créer une prestation
  end
  def new?
    true # Tous les users peuvent voir toutes les prestations
  end

  def show?
    true # Tous les users peuvent voir toutes les prestations
  end
end
