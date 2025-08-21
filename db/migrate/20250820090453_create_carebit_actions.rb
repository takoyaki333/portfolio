class CreateCarebitActions < ActiveRecord::Migration[7.2]
  def change
    create_table :carebit_actions do |t|
      t.integer :category
      t.string :title

      t.timestamps
    end
  end
end
