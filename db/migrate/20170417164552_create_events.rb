class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date
      t.text :description
      t.integer :max_tickets
      t.integer :tickets_left
      t.integer :price
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
