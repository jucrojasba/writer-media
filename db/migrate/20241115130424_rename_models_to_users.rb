class RenameModelsToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :models, :users
  end
end
