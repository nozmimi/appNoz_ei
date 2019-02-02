class CreateSnaCalyears < ActiveRecord::Migration[5.2]
  def change
    create_table :sna_calyears do |t|
      t.string :period_time
      t.string :category_code
      t.string :category_name
      t.string :date_code
      t.string :date_name
      t.integer :$data
      t.string :$unit
      t.string :update_date

      t.timestamps
    end
  end
end
