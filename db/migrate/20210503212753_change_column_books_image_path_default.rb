class ChangeColumnBooksImagePathDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :image_path, :string, default: "https://www.anglo-egyptian.com/books_posters/defbookcover.jpg?v=1528540330"
  end
end
