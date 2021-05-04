class RenameTransactionstoMediaTransactions < ActiveRecord::Migration[6.1]
  def change
    rename_table :transactions, :media_transactions
  end
end
