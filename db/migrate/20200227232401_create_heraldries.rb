class CreateHeraldries < ActiveRecord::Migration[6.0]
  def change
    create_table :heraldries do |t|
      t.string :colors
      t.string :blazon
      t.string :motto
      t.integer :member_id

      t.timestamps
    end
  end
end
