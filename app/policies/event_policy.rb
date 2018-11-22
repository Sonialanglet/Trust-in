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
        user.admin?
      end

  def create?
     user.admin?
    end

    def edit?
      user.admin?
    end

    def destroy?
      user.admin?
    end

    def update?
      user.admin?
    end

end
