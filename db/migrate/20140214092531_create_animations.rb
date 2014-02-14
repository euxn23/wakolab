class CreateAnimations < ActiveRecord::Migration
  def change
    create_table :animations do |t|
      t.string :title
      t.string :owner
      t.string :cat
      t.text :detail
      t.integer :episodes
      t.string :uid
      t.string :sid

      t.timestamps
    end
  end
end
