class CorrectUserColumnInPublications < ActiveRecord::Migration[6.0]
  def change
    remove_column :publications, :user, :references
    add_reference :publications, :user, foreign_key: true
  end
end
