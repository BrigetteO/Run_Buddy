class RunsController < ApplicationController
  before_action :set_run, only: [:edit, :update, :destroy]

  def index
    @runs = Run.paginate(page: params[:page], per_page: 8)
  end

  def new
    @run = Run.new
  end

  def edit
  end

  def create
    @run = current_user.runs.build(run_params)
    if @run.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def update
    if @run.update(run_params)
      redirect_to profile_path(current_user), notice: 'Run was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @run.destroy
    redirect_to profile_path(current_user), notice: 'Run was successfully destroyed.' 
  end

  private
    def set_run
      @run = Run.find(params[:id])
    end

    def run_params
      params.require(:run).permit(:title, :location, :date, :time, :miles)
    end
end
