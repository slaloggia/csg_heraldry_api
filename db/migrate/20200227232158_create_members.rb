class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :guild_name
      t.string :rank
      t.string :focus
      t.integer :joined

      t.timestamps
    end
  end
end
