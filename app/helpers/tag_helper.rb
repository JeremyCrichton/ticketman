module TagHelper
  def number_of_tickets_by_tag(tag_id)
    TicketTag.where(tag_id: tag_id).size
  end
end