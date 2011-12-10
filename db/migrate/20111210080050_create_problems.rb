class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :problem_title
      t.string :problem_short_title
      t.date :time_of_creation
      t.integer :time_limit

      t.timestamps
    end
  end
end
