class AddStuffToInvites < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :email, :string
    add_column :invites, :token, :string
    add_reference :invites, :post, index: true, foreign_key: true
  end
end
