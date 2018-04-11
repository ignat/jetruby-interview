class RenameWhenFields < ActiveRecord::Migration[5.1]
  def change
    rename_column :appointments, :when, :starts_at
    rename_column :reminders, :when, :minutes_before_appointment
  end
end
