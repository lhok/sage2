class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :catalog
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
