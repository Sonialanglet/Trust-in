class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end


    def show?
      true # Tous les users peuvent voir toutes les prestations
    end

    def new?
        true
      end

  def create?
     true
    end

    def edit?
      true
    end

    def destroy?
      true
    end

    def update?
      true
    end

end
