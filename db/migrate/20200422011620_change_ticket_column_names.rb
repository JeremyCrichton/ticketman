class ChangeTicketColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :creator, :creator_id
    rename_column :tickets, :assignee, :assignee_id
  end
end
