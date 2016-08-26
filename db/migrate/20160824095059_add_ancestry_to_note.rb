class AddAncestryToNote < ActiveRecord::Migration
  def change
  	  add_column :notes, :ancestry, :string
      add_index :notes, :ancestry
  end
end
