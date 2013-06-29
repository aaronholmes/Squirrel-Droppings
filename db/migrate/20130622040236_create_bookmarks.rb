class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.text :summary
      t.string :screenshot

      t.timestamps
    end
  end
end
