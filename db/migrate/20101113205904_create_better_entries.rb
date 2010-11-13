class CreateBetterEntries < ActiveRecord::Migration
  def self.up
    create_table :better_entries do |t|
      t.integer :user_id
      t.string :word
      t.text :definition

      t.timestamps
    end
  end

  def self.down
    drop_table :better_entries
  end
end
