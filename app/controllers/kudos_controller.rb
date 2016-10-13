class KudosController < ApplicationController

  def create
    @kudo = Kudo.create(user_id: current_user.id, run_id: params[:run_id])
  end
end
