class RemovePostcordFromDestinations < ActiveRecord::Migration[6.1]
  def change
    remove_column :destinations, :postcord, :string
  end
end
