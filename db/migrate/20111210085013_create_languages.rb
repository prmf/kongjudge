class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :language_name
      t.integer :language_code

      t.timestamps
    end
  end
end
