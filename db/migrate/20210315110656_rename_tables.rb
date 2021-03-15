class RenameTables < ActiveRecord::Migration[6.0]
  def change
    rename_table :appointment, :appointments
    rename_table :doctor, :doctors
    rename_table :patient, :patients
  end
end
