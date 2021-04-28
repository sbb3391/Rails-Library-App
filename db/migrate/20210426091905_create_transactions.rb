class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :library_transactions do |t|
      t.belongs_to :library
      t.datetime :expiration_date
      t.timestamps
    end
  end
end
