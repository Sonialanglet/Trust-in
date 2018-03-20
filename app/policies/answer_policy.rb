class AnswerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def new?
    true # Tous les users peuvent voir toutes les replies
  end

  def create?
    true # Tous les users peuvent créer une reply
  end

  def show?
    true # Tous les users peuvent voir toutes les replies
  end
end
