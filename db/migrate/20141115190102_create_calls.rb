class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.references :hook, index: true
      t.string :event_type
      t.json :data
      t.string :status, default: 'pending'

      t.timestamps null: false
    end
  end
end
