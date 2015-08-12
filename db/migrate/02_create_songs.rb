class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :lyrics
      t.string :url
      t.string :album_cover
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end