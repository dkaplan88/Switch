class AddPercentageToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :percentage, :integer
  end
end
