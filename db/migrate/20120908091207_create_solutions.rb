class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :catalog
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
