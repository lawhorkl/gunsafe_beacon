class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alerts do |t|
      t.string :message
      t.string :location

      t.timestamps
    end
  end
end
