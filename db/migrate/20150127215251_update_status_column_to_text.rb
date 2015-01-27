class UpdateStatusColumnToText < ActiveRecord::Migration
  def change
    change_column(:products, :status, :text)
  end
end
