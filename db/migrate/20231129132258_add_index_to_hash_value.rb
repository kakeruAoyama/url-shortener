class AddIndexToHashValue < ActiveRecord::Migration[7.0]
  def change
    add_index :urls, :hash_value, unique: true
  end
end
