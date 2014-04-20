class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :profile
      t.text :hobby
      t.text :skill
      t.text :lately
      t.text :history

      t.timestamps
    end
  end
end
