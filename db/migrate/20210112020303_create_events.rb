class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.bigint :studio_id
      t.string :name, null: false
      t.string :place, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.text :content, null: false
      t.string :performer, null: false

      t.timestamps
    end
    add_index :events, :studio_id
  end
end
