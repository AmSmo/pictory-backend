class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :name
      t.datetime :date
      t.string :caption
      t.string :url

      t.timestamps
    end
  end
end
