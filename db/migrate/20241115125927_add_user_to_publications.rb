class AddUserToPublications < ActiveRecord::Migration[7.2]
  def change
    add_column :publications, :user, :string
    add_column :publications, :references, :string
  end
end
