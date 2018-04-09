class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.integer :appointment_id, null: false, index: true
      # Number of minutes before appointment
      t.integer :when, null: false, default: 10
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
