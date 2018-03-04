class AddSerialToAlerts < ActiveRecord::Migration[5.1]
  def change
    add_column :alerts, :serial, :string
  end
end
