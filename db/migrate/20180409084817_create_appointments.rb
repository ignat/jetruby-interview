class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :user_id, null: false, index: true
      t.string :title, null: false
      t.integer :status, null: false, default: 0
      t.datetime :when, null: false
      t.timestamps
    end
  end
end
