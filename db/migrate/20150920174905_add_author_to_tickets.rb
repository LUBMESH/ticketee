class AddAuthorToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :author, index: true
    add_foreign_key :tickets, :user, column: :author_id
  end
end
