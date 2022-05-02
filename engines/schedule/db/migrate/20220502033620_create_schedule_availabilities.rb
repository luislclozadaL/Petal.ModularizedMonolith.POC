class CreateScheduleAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_availabilities do |t|
      t.string :clinic
      t.string :doctor
      t.datetime :date

      t.timestamps
    end
  end
end
