class AddColumnTitleCategoryList < ActiveRecord::Migration[5.2]
  def change
    add_column :category_lists, :table_title, :string
  end
end
