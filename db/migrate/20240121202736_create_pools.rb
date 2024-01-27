class CreatePools < ActiveRecord::Migration[7.1]
  def change
    create_table :pools do |t|
      t.string :address
      t.string :name
      t.integer :liquidity
      t.references :protocol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
