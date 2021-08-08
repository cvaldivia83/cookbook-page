class Recipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :prep_time
      t.string :rating
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
