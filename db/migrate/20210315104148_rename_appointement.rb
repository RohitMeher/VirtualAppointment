class RenameAppointement < ActiveRecord::Migration[6.0]
  def change
    rename_table :appointments, :appointment
  end
end
