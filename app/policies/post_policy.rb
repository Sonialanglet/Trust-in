class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
      return true
    end

    def show?
      true # Tous les users peuvent voir toutes les prestations
    end

    def destroy?
      record.user == user
    end

    def update?
      record.user == user
    end
end
