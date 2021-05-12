class CreateMainLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :main_libraries do |t|
      
      t.timestamps
    end
  end
end
