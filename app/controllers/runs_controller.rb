class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  def index
    @runs = Run.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @run = Run.new
  end

  def edit
  end

  def create
    @run = current_user.runs.build(run_params)

    respond_to do |format|
      if @run.save
        format.html { redirect_to @run, notice: 'Run was successfully created.' }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
        format.json { render :show, status: :ok, location: @run }
      else
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to runs_url, notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_run
      @run = Run.find(params[:id])
    end

    def run_params
      params.require(:run).permit(:title, :location, :date, :time, :miles)
    end
end
