class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor do |t|
      t.string :name
      t.string :email_address
      t.string :phone_number
      t.string :specialisation
      t.time   :working_start_time
      t.time   :working_end_time
    end
  end
end
