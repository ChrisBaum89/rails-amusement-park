class ChangeHeightToheight < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :Height, :height
    rename_column :users, :Happiness, :happiness
    rename_column :users, :Nausea, :nausea
    rename_column :users, :Tickets, :tickets
  end
end
