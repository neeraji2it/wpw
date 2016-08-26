class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
 
      t.string :attachment
      t.string :name
      t.string :email
      t.string :subject
        t.string :description
      t.timestamps null: false
    end
  end
end
