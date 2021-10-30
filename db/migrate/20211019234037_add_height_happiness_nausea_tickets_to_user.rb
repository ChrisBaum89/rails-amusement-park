class AddHeightHappinessNauseaTicketsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users_tables, :Height, :integer
    add_column :users_tables, :Happiness, :string
    add_column :users_tables, :Nausea, :string
    add_column :users_tables, :Tickets, :integer
  end
end
