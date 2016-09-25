class KudosController < ApplicationController
  before_action :set_kudo, only: [:show]

  def show
  end

  def new
    @kudo = Kudo.new
  end

  def create
    @kudo = Kudo.new(kudo_params)

    respond_to do |format|
      if @kudo.save
        format.html { redirect_to @kudo, notice: 'Kudo created!' }
        format.json { render :show, status: :created, location: @kudo }
      else
        format.html { render :new }
        format.json { render json: @kudo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_kudo
      @kudo = Kudo.find(params[:id])
    end

    def kudo_params
      params.require(:kudo).permit(:user_id, :run_id)
    end
end
