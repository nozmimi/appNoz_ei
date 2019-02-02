class DestroyCatlist2 < ActiveRecord::Migration[5.2]
  def change
    drop_table:category_lists    
  end
end
