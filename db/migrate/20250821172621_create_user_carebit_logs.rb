class CreateUserCarebitLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :user_carebit_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :carebit_action, null: false, foreign_key: true
      t.date :performed_on, null: false
      t.integer :status, null: false, default: 0
      t.text :diary_note
      t.datetime :completed_at

      t.timestamps
    end

    # ユーザー × 日付でユニーク
    add_index :user_carebit_logs, [ :user_id, :performed_on ], unique: true

    # 集計用インデックス
    add_index :user_carebit_logs, [ :user_id, :status, :performed_on ]
  end
end
