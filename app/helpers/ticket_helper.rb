module TicketHelper
  def list_ticket_tags(ticket)
    ticket.tags.map{ |tag| tag.name }.join(', ')
  end
end