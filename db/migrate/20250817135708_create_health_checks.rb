class CreateHealthChecks < ActiveRecord::Migration[7.2]
  def change
    create_table :health_checks do |t|
      t.boolean :ok

      t.timestamps
    end
  end
end
