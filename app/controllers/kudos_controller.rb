class KudosController < ApplicationController
	
  def create
    @kudo = Kudo.create(user_id: current_user.id, run_id: params[:run_id])
  	@run = Run.find_by(id: @kudo.run_id)
    respond_to do |format|
  	  format.html { redirect_to runs_path}
  	  format.json { render json: {kudos: @run.kudos_count}}
    end
  end
end
