class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.references :call, index: true
      t.string :url
      t.string :http_code
      t.string :http_status
      t.string :status

      t.timestamps null: false
    end
  end
end
