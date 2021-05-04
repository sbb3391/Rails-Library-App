class ChangeBooksNullTrue < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :library_id, :integer, null: true
  end
end
