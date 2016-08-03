class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamps
      t.string :event_type
      t.string :comment
    end
  end
end
