class AddAasmStateToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :aasm_state, :string
  end
end
