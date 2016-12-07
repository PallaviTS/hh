class CreateMoneyRushes < ActiveRecord::Migration[5.0]
  def change
    create_table :money_rushes do |t|
      t.string :place_type
      t.string :place_id
      t.text :address
      t.string :lat
      t.string :lng
      t.text :name
      t.boolean :cash
      t.boolean :long_queue
      t.boolean :open
      t.string :search_by
      t.datetime :reported_at

      t.timestamps
    end
  end
end
