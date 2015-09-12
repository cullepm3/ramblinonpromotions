class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :years
      t.integer :wins
      t.integer :draft
      t.integer :champ
      t.integer :pts_champ
      t.integer :low_seed
      t.integer :goat
      t.decimal :total
      t.string :image_url
      t.boolean :active
      t.decimal :wins_avg
      t.decimal :draft_avg
      t.decimal :total_avg

      t.timestamps null: false
    end
  end
end
