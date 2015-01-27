class UpdateStatusColumnToBoolean < ActiveRecord::Migration
  def change
    remove_column(:products, :status, :text)
    add_column(:products, :status, :boolean)
  end
end
