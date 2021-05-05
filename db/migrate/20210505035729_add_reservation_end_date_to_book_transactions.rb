class AddReservationEndDateToBookTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :book_transactions, :reservation_end_date, :datetime
  end
end
