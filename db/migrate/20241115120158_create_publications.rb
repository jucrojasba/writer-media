class CreatePublications < ActiveRecord::Migration[7.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
