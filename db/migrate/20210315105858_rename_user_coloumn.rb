class RenameUserColoumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :patient, :flast_name, :last_name
  end
end
