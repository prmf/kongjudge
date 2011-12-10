class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :code
      t.string :result

      t.timestamps
    end
  end
end
