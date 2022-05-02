# This migration comes from patients (originally 20220502000904)
class CreatePatientsPatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients_patients do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :active
      t.string :hin
      t.timestamps
    end
  end
end
