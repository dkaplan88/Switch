class AddDeviseIdToHistories < ActiveRecord::Migration
  def change
    remove_column :histories, :devise_id
    add_column :histories, :devise_id, :integer
  end
end
