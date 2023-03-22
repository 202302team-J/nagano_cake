class AddPostcodeToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :postcode, :string
  end
end
