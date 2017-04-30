class AddReferencesToInvites < ActiveRecord::Migration[5.0]
  def change
    add_reference :invites, :sender, references: :users
    add_reference :invites, :recipient, references: :users
  end
end
