class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :devise_id
      t.string :action
      t.boolean :status
      t.integer :level

      t.timestamps
    end
  end
end
