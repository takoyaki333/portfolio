class CreateEncouragementMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :encouragement_messages do |t|
      t.string :text

      t.timestamps
    end
  end
end
