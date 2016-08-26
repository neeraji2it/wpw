class AddNoteIdToCategories < ActiveRecord::Migration
  def change
  		add_column :categories, :note_id, :integer
  end
end
