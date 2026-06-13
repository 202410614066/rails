class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :bio
      t.string :github
      t.string :twitter
      t.string :linkedin
      t.string :image

      t.timestamps
    end
  end
end
