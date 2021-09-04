class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.bigint :owner_id
      t.string :name, null:false
      t.string :place, null:false
      t.datetime :start_at, null:false
      t.datetime :end_at, null:false
      t.integer :event_type, null:false
      t.text :definition, null:false
      t.string :audience, null:false
      t.text :comment

      t.timestamps
    end
  end
end
