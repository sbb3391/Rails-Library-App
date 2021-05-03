class AddLibraryIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :library_id, :integer
  end
end
