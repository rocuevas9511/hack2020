class AddHardwareSerialToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :hardware_serial, :string
  end
end
