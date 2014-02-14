class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :what
      t.text :how
      t.string :who
      t.string :with
      t.text :others
      t.date :when_from
      t.date :when_to
      t.string :span_from
      t.string :span_to
      t.boolean :private
      t.integer :uid
      t.string :sid

      t.timestamps
    end
  end
end
