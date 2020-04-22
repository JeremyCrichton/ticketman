class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  
  def index
    filter_by_project_id = params[:project_id]
    filter_by_status = params[:status]
    filter_by_tag = params[:ticket_tag]

    @tickets = filter_by_project_id.present? ? Ticket.where(project_id: filter_by_project_id) : Ticket.all

    if filter_by_status.present?
      @tickets = @tickets.where(status: filter_by_status)
    end
    
    if filter_by_tag.present?
      @tickets = @tickets.joins(:tags).where('tags.id': filter_by_tag)
    end
  end

  def show
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
    @projects = Project.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator = current_user

    if @ticket.save
      redirect_to @ticket, notice: "Ticket was created."
    else
      render :new
    end
  end

  def edit
    @projects = Project.all
  end

  def update
    @projects = Project.all
    
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: "Ticket was updated."
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy

    redirect_to tickets_path, notice: "Ticket was deleted."
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :body, :project_id, :status, :assignee_id, tag_ids: [])
  end
end