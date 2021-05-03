class CreateBookTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :book_transactions do |t|
      t.belongs_to :transaction
      t.belongs_to :book
      t.integer :length_days
      t.timestamps
    end
  end
end
