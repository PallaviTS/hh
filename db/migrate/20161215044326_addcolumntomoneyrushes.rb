class Addcolumntomoneyrushes < ActiveRecord::Migration[5.0]
  def change
    add_column :money_rushes, :distance, :string, default: 'N/A'
  end
end
