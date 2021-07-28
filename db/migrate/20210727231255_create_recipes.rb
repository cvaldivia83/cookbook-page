class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :prep_time
      t.string :rating
      t.text :url
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
