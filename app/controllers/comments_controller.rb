class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @run = Run.find(params[:run_id])
    @comments = Comment.all
  end 

  def show
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.run_id = params[:run_id]
    if @comment.save
      redirect_to runs_path
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment updated!'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to runs_path, notice: 'Comment deleted!'
  end

 private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :run_id)
    end
end
