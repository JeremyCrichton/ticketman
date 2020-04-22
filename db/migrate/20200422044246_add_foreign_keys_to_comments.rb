class AddForeignKeysToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key "comments", "users", column: "creator_id"
    add_foreign_key "comments", "tickets", column: "ticket_id"
  end
end
