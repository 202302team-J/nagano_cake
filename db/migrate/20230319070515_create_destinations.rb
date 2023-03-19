class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.integer :customer_id
      t.string :postcord
      t.string :address
      t.string :name
      t.timestamps
    end
  end
end
