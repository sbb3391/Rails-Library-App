class CreateAlbumTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :album_transactions do |t|
      t.belongs_to :transactions
      t.belongs_to :book
      t.integer :transaction_length
      t.timestamps
    end
  end
end
