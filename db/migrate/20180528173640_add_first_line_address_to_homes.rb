class AddFirstLineAddressToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :first_line_address, :string
  end
end
