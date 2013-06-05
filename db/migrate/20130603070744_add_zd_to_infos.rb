class AddZdToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :zd, :string
  end
end
