class AddBookReferenceToMainLibrary < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :main_library, index: true, default: 1
  end
end
