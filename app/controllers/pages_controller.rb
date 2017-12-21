class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized

  def home
    @prestations = Prestation.all.sample(4)
  end
end
