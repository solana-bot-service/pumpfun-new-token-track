class CreateTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :tokens do |t|
      t.string :name
      t.string :symbol
      t.string :address
      t.decimal :liquidity
      t.decimal :market_cap
      t.decimal :price
      t.decimal :supply
      t.integer :watchers
      t.string :logo_url

      t.index :address, unique: true
      t.index :symbol

      t.timestamps
    end
  end
end
