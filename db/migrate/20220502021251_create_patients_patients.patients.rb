# This migration comes from patients (originally 20220502000904)
class CreatePatientsPatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients_patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :active
      t.string :boolean
      t.string :hin
      t.string :integer

      t.timestamps
    end
  end
end
