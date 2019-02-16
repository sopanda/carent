class AddVerifiedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :aasm_state, :string
  end
end
