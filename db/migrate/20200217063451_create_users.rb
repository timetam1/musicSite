class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
