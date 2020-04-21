class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  
  def index
    @tickets = Ticket.all
  end

  def show
    
  end

  def new
    @ticket = Ticket.new
    @projects = Project.all
  end

  def create
    @ticket = Ticket.new(ticket_params)

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
    params.require(:ticket).permit(:name, :body, :project_id, :status, tag_ids: [])
  end
end