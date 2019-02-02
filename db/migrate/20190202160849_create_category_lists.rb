class CreateCategoryLists < ActiveRecord::Migration[5.2]
  def change
    create_table :category_lists do |t|
      t.string :table_title
      t.string :category_code
      t.string :category_name
      t.string :update_date
      
      t.timestamps
    end
  end
end
