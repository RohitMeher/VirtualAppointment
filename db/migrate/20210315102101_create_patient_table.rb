class CreatePatientTable < ActiveRecord::Migration[6.0]
  def change
    create_table :patient do |t|
      t.string :first_name
      t.string :flast_name
      t.string :email_address
      t.string :phone_number
    end
  end
end
