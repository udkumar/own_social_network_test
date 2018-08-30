class CreateSubscribeBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribe_blocks do |t|
      t.integer :user_id
      t.integer :subscribe_id
      t.boolean :is_block, default: false
      t.timestamps
    end
  end
end
