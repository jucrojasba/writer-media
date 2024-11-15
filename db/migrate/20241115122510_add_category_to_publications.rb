class AddCategoryToPublications < ActiveRecord::Migration[7.2]
  def change
    add_column :publications, :category, :string
  end
end
