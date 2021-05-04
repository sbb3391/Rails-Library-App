class ChangeColumnTransactionIdInBookTransactions < ActiveRecord::Migration[6.1]
  def change
    rename_column :book_transactions, :transaction_id, :media_transaction_id
  end
end
