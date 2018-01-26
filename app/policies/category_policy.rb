class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true # Tous les users peuvent voir toutes les prestations
  end
end
