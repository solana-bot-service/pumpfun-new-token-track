class CreatePoolsTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :pools_tokens, id: false do |t|
      t.belongs_to :pool
      t.belongs_to :token
    end
  end
end
