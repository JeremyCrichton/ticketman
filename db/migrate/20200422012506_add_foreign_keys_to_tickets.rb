class AddForeignKeysToTickets < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key "tickets", "users", column: "assignee_id"
    add_foreign_key "tickets", "users", column: "creator_id"
  end
end
