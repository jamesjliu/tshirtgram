class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.integer :user_id
      t.integer :views, :default=>0

      t.timestamps
    end
  end
end
