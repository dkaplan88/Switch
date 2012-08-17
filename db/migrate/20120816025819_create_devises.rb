class CreateDevises < ActiveRecord::Migration
  def change
    create_table :devises do |t|
      t.string :name

      t.timestamps
    end
  end
end
