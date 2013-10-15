class AddFavouriteTeamToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favourite_team, :string
  end
end
