class CommentsController < ApplicationController
  before_action :set_ticket, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :require_user, only: [:create]
  before_action :require_creator, only: [:edit, :update, :destroy]

  def create
    # byebug
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new(comment_params)
    @comment.creator = current_user
    @comment.ticket = @ticket
    
    if params[:ticket_status].present?
      @ticket.status = params[:ticket_status]
    end

    if @comment.save && @ticket.save
      redirect_to @ticket, notice: "Your comment was added."
    else
      render 'tickets/show'
    end
  end

  def edit 
    
  end

  def update
    @comment.body = params[:comment][:body]

    if @comment.save
      redirect_to @ticket, notice: "Your comment was updated."
    else
      render @ticket
    end
  end

  def destroy
    @comment.destroy
    redirect_to @ticket, notice: "Your comment was deleted."
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def require_creator
    if current_user != @comment.creator
      flash[:error] = "You can't edit or delete someone else's comments."
      redirect_back fallback_location: root_path
    end
  end
end