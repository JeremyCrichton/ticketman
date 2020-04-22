class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new(comment_params)
    @comment.creator = current_user
    @comment.ticket = @ticket

    if @comment.save
      redirect_to ticket_path(@ticket), notice: "Your comment was added."
    else
      render 'tickets/show'
    end
  end
end