class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :body
      t.datetime :posted_at, null: false
      t.string :status, null: false, default: "draft"
      t.timestamps null: false
    end
    add_index :entries, :user_id
  end
end
