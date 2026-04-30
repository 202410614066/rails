class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :article
      t.string :status
      t.string :integer

      t.timestamps
    end
  end
end
