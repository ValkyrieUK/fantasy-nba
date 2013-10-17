class Teams < ActiveRecord::Migration
  def change
    add_column :teams, :wins, :integer
    add_column :teams, :l10, :string
    add_column :teams, :streak, :string
  end

  def drop
    drop_table :hometown
  end
end
