class CreateSubscribes < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribes do |t|
      t.references :user
      t.string :email
      t.boolean :is_block, default: false
      t.timestamps
    end
  end
end
