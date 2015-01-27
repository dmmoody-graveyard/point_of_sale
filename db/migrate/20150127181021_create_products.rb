class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.column(:name, :string)
      t.column(:price, :money) #if things get weird look here # ask about scale
      t.column(:status, :boolean)
    end
  end
end
