class CreateClicks < ActiveRecord::Migration[7.0]
  def change
    create_table :clicks do |t|
      t.references :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
