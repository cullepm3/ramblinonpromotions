class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :year, null: false
      t.string :name, null: false
      t.integer :draft
      t.integer :r1, null: false, default: 0
      t.integer :r2, null: false, default: 0
      t.integer :r3, null: false, default: 0
      t.integer :r4, null: false, default: 0
      t.integer :r5, null: false, default: 0
      t.integer :r6, null: false, default: 0
      t.integer :wins, null: false, default: 0
      t.integer :pts, null: false, default: 0
      t.boolean :low, null: false, default: 0
      t.decimal :earnings, null: false, default: 0
      t.boolean :ptschamp, null: false, default: 0
      t.boolean :goat, null: false, default: 0
      t.integer :manager_id, null:false
      t.integer :assistant_id

      t.timestamps null: false
    end
  end
end
