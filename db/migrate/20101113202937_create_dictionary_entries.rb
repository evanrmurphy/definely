class CreateDictionaryEntries < ActiveRecord::Migration
  def self.up
    create_table :dictionary_entries do |t|
      t.integer :user_id
      t.string :word
      t.string :definition

      t.timestamps
    end
  end

  def self.down
    drop_table :dictionary_entries
  end
end
