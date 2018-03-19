class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true # Tous les users peuvent voir tous les bookings
  end

  def new?
    true # Tous les users peuvent voir tous les bookings
  end

  def create?
    true # Tous les users peuvent créer un booking
  end



  def destroy?
   true
  end

end
