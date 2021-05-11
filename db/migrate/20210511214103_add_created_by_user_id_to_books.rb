class AddCreatedByUserIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :created_by_user_id, :integer
  end
end
