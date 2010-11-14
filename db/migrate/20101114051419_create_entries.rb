class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :word
      t.text :definition
      t.integer :user_id

      t.timestamps
    end
    add_index :microposts, :user_id
  end

  def self.down
    drop_table :entries
  end
end
