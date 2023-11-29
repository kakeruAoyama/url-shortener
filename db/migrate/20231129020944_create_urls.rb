class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :original
      t.string :hash_value

      t.timestamps
    end
  end
end
